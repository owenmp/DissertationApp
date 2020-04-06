//
//  DataStoreRebuild.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 16/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import Foundation
import SQLite3

class DataStoreRebuild {

    /**
     * The sqlite3 database. For this example, it is held as a variable
     * for the object. You could also open and close the database in
     * each of the methods which access the database.
     */
    fileprivate var database: OpaquePointer? = nil
    
    /**
     * Initialise the object by opening the database.
     */
    init() {
        if let filePath = prepareDatabasePath() {
        
           let result = sqlite3_open(filePath, &database)
        
           if result != SQLITE_OK {
              hardFail("Unable to open the database")
           }
        }
        else {
           hardFail("Error preparing the file path to sqlite folder")
        }
    }
    
    /**
     *
     */
    fileprivate func prepareDatabasePath() -> String? {
        
        let documentsFolderPath =
           NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        
        let sqliteFilePath = documentsFolderPath + "databaseForNewProject.db"
        
        if !FileManager.default.fileExists(atPath: sqliteFilePath) {
            let bundle = Bundle.main
            let bundlePath = bundle.path(forResource: "databaseForNewProject", ofType: "db")
            
            do {
                try FileManager.default.copyItem(atPath: bundlePath!,
                                                             toPath: sqliteFilePath)
                print("File copied")
            }
            catch let error as NSError {
                print("Unable to copy file: \(error)")
                return nil
            }
        }
        
        return sqliteFilePath
        
    }
    
    // other code
    
    /**
     * Simple failure method that will close the database, display
     * an error message and then abort the application.
     */
    fileprivate func hardFail(_ message: String) {
        sqlite3_close(database)
        print(message)
        abort() // handle the error in a better way...
    }
    
    /**
     * Utility method that is used to extract text from a sqlite3 result
     * statement and turn this into a String.
     */
    
    
    
    fileprivate func getTextValue(_ statement: OpaquePointer,
                              atColumnIndex index: Int32) -> String? {
        var data = "Unknown"
        
        if let value = sqlite3_column_text(statement, index) {
            data = String(cString: value)
        }
        return data
    }
    
    func stringAtField(_ statementPointer: OpaquePointer, fieldIndex: Int ) -> String {
            var answer = "Error - DBAccess failed"
            if let rawString = sqlite3_column_text(statementPointer, Int32(fieldIndex) ) {
                answer = String(cString: rawString)
            }
            return answer
        }
    func readNew(){
        let query =  "SELECT Name FROM ActivityLog WHERE DATE = '07-03-2020'"
        var statement: OpaquePointer? = nil
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
            let first = stringAtField(statement!,fieldIndex: 0)
            print(first)
            }
            sqlite3_finalize(statement)
            
    }
    }
    
    func getAveragesForMood3 (moodLevel: Int) -> [Int] {
        var averages: [Int] = []
        let query = "SELECT * FROM MAIN WHERE MOOD = (\(moodLevel));"
        var statement: OpaquePointer? = nil
        var water: Int = 0
        var alcohol: Int = 0
        var stress: Int = 0
        var exercise: Int = 0
        var sleep: Int = 0
        var productivity: Int = 0
        var count: Int = 0
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
            let sleepRead = sqlite3_column_int(statement!, 1)
            let waterRead = sqlite3_column_int(statement!, 2)
            let stressRead = sqlite3_column_int(statement!, 3)
            let exerciseRead = sqlite3_column_int(statement!, 4)
            let alcoholRead = sqlite3_column_int(statement!, 6)
            //let moodRead = sqlite3_column_int(statement!, 8)
            let productivityRead = sqlite3_column_int(statement!, 8)
            
            water += Int(waterRead)
            alcohol += Int(alcoholRead)
            stress += Int(stressRead)
            exercise += Int(exerciseRead)
            sleep += Int(sleepRead)
            productivity += Int(productivityRead)
            count += 1
            }
            sqlite3_finalize(statement)
        
            if count == 0 {
                water = 0
                alcohol = 0
                stress = 0
                exercise = 0
                sleep = 0
                productivity = 0
                averages.append(water)
                averages.append(alcohol)
                averages.append(stress)
                averages.append(exercise)
                averages.append(sleep)
                averages.append(productivity)
                
            } else {
            water /= count
            alcohol /= count
            stress /= count
            exercise /= count
            sleep /= count
            productivity /= count
            
            averages.append(sleep)
            averages.append(water)
            averages.append(stress)
            averages.append(exercise)
            averages.append(alcohol)
            averages.append(productivity)
            }

        }
          print(averages)
           return averages
    }
    


        
        
        
        
      
    
    
    func getWater()-> [Int]{
        var waterValues: [Int] = []
        let query = "SELECT MOOD FROM MAIN WHERE WATER = 2"
        var statement: OpaquePointer? = nil
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
               while(sqlite3_step(statement) == SQLITE_ROW){
                let first = stringAtField(statement!, fieldIndex: 0)
                print(first)
                let water = Int(first)!
                waterValues.append(water)
            }
            sqlite3_finalize(statement)
        
    }
        return waterValues
    }
    
    func readRows(){
   // var entries: [String] = []
    let query = "SELECT date FROM MAIN;"
    var statement: OpaquePointer? = nil
    if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
    while(sqlite3_step(statement) == SQLITE_ROW){
    let first = stringAtField(statement!, fieldIndex: 0)
    print(first)
    let second = stringAtField(statement!, fieldIndex: 0)
    print(second)
        let third = stringAtField(statement!, fieldIndex: 0)
        print(third)
        }
sqlite3_finalize(statement)
    }
    }
    func readActivities(){
        let query = "SELECT * FROM ACTIVITIES;"
        var statement:OpaquePointer? = nil
        if sqlite3_prepare_v2(database,query , -1, &statement, nil) == SQLITE_OK {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                let name = stringAtField(statement!, fieldIndex: 0)
                print(name)
                let description = stringAtField(statement!, fieldIndex: 1)
                print(description)
            }
            sqlite3_finalize(statement)
        }
    }
    
    
    func testRead(){
        let query = "SELECT DATE FROM MAIN;"
        var statement: OpaquePointer? = nil
        let result = sqlite3_prepare_v2(database,query,-1,&statement,nil)
        if result == SQLITE_OK{
            let dateValue = getTextValue(statement!, atColumnIndex: 0)
            print(dateValue)
        }
        sqlite3_finalize(statement)
    }
    
    
      let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
    let insertActivityString = "INSERT INTO Activities (NAME,DESCRIPTION) VALUES (?,?);"
    //let insertActivityString = "INSERT INTO ACTIVIITIES"
    func insertNewActivity(Name: String, Description: String){
        var insertStatement: OpaquePointer?
        if sqlite3_prepare_v2(database,insertActivityString, -1, &insertStatement, nil) == SQLITE_OK {
            let insertedName = Name as NSString
           // insertedName = "Studying"
            //insertedName = name as NSString
            let insertedDescription = Description as NSString
           // insertedDescription = "Work"
            sqlite3_bind_text(insertStatement, 1, insertedName.utf8String, -1, SQLITE_TRANSIENT)
            sqlite3_bind_text(insertStatement, 2, insertedDescription.utf8String, -1, SQLITE_TRANSIENT)
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                     print("\nSuccessfully inserted row.")
                   } else {
                     print("\nCould not insert row.")
                   }
                 } else {
                   print("\nINSERT statement is not prepared.")
                //inser notes isn't working
                
            }
            sqlite3_finalize(insertStatement)
        }
    
    //let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
       let insertStatementString = "INSERT INTO main (DATE) VALUES (?);"
       func insert(){
           var insertStatement: OpaquePointer?
           //1
           if sqlite3_prepare_v2(database,insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
               let date: NSString = "14071999"
               sqlite3_bind_text(insertStatement,1, date.utf8String, -1, SQLITE_TRANSIENT)
               
               if sqlite3_step(insertStatement) == SQLITE_DONE {
                   print("\nSuccessfully inserted row")
               } else
                   { print("\nCould not insert a row")
               }
           }
           else
               { print("\nInsert statement not prepared")
               }
               sqlite3_finalize(insertStatement)
               }
   
    
    
    let insertStatementString2 = "INSERT INTO MAIN (DATE,SLEEP,WATER,STRESS,EXERCISE,LOCATION,ALCOHOL,NOTES,MOOD,PRODUCTIVITY) VALUES (?,?,?,?,?,?,?,?,?,?);"
    func insertTestObject(){
           var statement : OpaquePointer?
           let tester = Mood(Date: "17-03-2020", Sleep: 6, Water: 5, Stress: 3, Exercise: 6, Location: "Aber", Alcohol: 8, Mood: 9, Productivity: 10, Notes: "I Had a bad day")
        
         if sqlite3_prepare_v2(database,insertStatementString2, -1, &statement, nil) == SQLITE_OK {
            let date : NSString = tester.Date as NSString
            sqlite3_bind_text(statement, 1, date.utf8String, -1, SQLITE_TRANSIENT)
            sqlite3_bind_int(statement, 2, Int32(tester.Sleep))
            sqlite3_bind_int(statement, 3, Int32(tester.Water))
            sqlite3_bind_int(statement, 4, Int32(tester.Stress))
            sqlite3_bind_int(statement, 5, Int32(tester.Exercise))
            let hello : NSString = tester.Location as NSString
            sqlite3_bind_text(statement, 6, hello.utf8String,-1,SQLITE_TRANSIENT)
            let notes: NSString = tester.Notes as NSString
            sqlite3_bind_int(statement, 7, Int32(tester.Alcohol))
            sqlite3_bind_text(statement, 8, notes.utf8String,-1,SQLITE_TRANSIENT)
            sqlite3_bind_int(statement, 9, Int32(tester.Mood))
           sqlite3_bind_int(statement, 10, Int32(tester.Productivity))
            if sqlite3_step(statement) == SQLITE_DONE {
                 print("\nSuccessfully inserted row.")
               } else {
                 print("\nCould not insert row.")
               }
             } else {
               print("\nINSERT statement is not prepared.")
            //inser notes isn't working
            
        }
        sqlite3_finalize(statement)
    }
    
    
    func insertDailyActivities(dailyActivities: [activityLog], date: String){
        var statement: OpaquePointer?
        var insertActivityStatement = "INSERT INTO ACTIVITYLOG (NAME,LENGTH,DATE, DESCRIPTION) VALUES (?,?,?,?);"
        for i in dailyActivities{
        if sqlite3_prepare_v2(database,insertActivityStatement, -1, &statement, nil) == SQLITE_OK {
            let nameString: NSString = i.name as NSString
            let descriptionString: NSString = i.description as NSString
            let dateString: NSString = date as NSString
            sqlite3_bind_text(statement, 1, nameString.utf8String, -1, SQLITE_TRANSIENT)
            sqlite3_bind_int(statement, 2, Int32(i.length))
            sqlite3_bind_text(statement, 3, dateString.utf8String, -1, SQLITE_TRANSIENT)
            sqlite3_bind_text(statement, 4, descriptionString.utf8String, -1, SQLITE_TRANSIENT)
            
            if sqlite3_step(statement) == SQLITE_DONE {
                     print("\nSuccessfully inserted row.")
                   } else {
                     print("\nCould not insert row.")
            }
                 } else {
                   print("\nINSERT statement is not prepared.")
                //inser notes isn't working
                
            }
            sqlite3_finalize(statement)
        
    }
    }
        
    
    
    
    func insertMoodObject(dailyEntry: Mood){
        var statement : OpaquePointer?
        if sqlite3_prepare_v2(database,insertStatementString2, -1, &statement, nil) == SQLITE_OK {
            let dateString: NSString = dailyEntry.Date as NSString
            sqlite3_bind_text(statement, 1, dateString.utf8String,-1, SQLITE_TRANSIENT)
                  // sqlite3_bind_int(statement, 1, Int32(30082020))
                   sqlite3_bind_int(statement, 2, Int32(dailyEntry.Sleep))
                   sqlite3_bind_int(statement, 3, Int32(dailyEntry.Water))
                   sqlite3_bind_int(statement, 4, Int32(dailyEntry.Stress))
                   sqlite3_bind_int(statement, 5, Int32(dailyEntry.Exercise))
            let locationString: NSString = dailyEntry.Location as NSString
                sqlite3_bind_text(statement, 6, locationString.utf8String,-1,SQLITE_TRANSIENT)
                let notes: NSString = dailyEntry.Notes as NSString
                sqlite3_bind_int(statement, 7, Int32(dailyEntry.Alcohol))
                sqlite3_bind_text(statement, 8, notes.utf8String,-1,SQLITE_TRANSIENT)
                sqlite3_bind_int(statement, 9, Int32(dailyEntry.Mood))
               sqlite3_bind_int(statement, 10, Int32(dailyEntry.Productivity))
                if sqlite3_step(statement) == SQLITE_DONE {
                     print("\nSuccessfully inserted row.")
                   } else {
                     print("\nCould not insert row.")
                   }
                 } else {
                   print("\nINSERT statement is not prepared.")
                //inser notes isn't working
                
            }
            sqlite3_finalize(statement)
        
        
        
        
    }
    
    let deleteStatementString = "DELETE FROM MAIN WHERE DATE = '80-03-20'"
    func deleteEntries(){
        var deleteStatement: OpaquePointer?
        if sqlite3_prepare_v2(database, deleteStatementString, -1, &deleteStatement,nil) ==
            SQLITE_OK {
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                    print("\nSuccessfully deleted row.")
                    } else {
                      print("\nCould not delete row.")
                    }
                  } else {
                    print("\nDELETE statement could not be prepared")
                  }
                  
                  sqlite3_finalize(deleteStatement)
                }
    
    func getActivities()-> [activity]{
        var activityRead: activity!
        var activityArray: [activity] = []
        let query = "SELECT * FROM ACTIVITIES;"
        var statement: OpaquePointer? = nil  // Pointer for sql to track returns
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
          while(sqlite3_step(statement) == SQLITE_ROW){
        let name = stringAtField(statement!, fieldIndex: 0)
        let description = stringAtField(statement!, fieldIndex: 1)
            
        let activityRead = activity(name: name, description: description)
            print(activityRead.name)
            print(activityRead.description)
            activityArray.append(activityRead)
            
            
        
       // return moodArray
    }
        }
        return activityArray
    }
    
    func searchEntries(filter: String, value: String) -> [Mood]{
       // var moodRead: Mood!
        var moodArray: [Mood] = []
        var query = ""
        if filter == "Mood" || filter == "Stress" || filter == "Productivity" || filter == "Exercise" || filter == "Sleep" || filter == "Alcohol" || filter == "Water" {
             query = "SELECT * FROM MAIN WHERE (\(filter)) = (\(value));"
        } else if filter == "Notes"{
             query = "SELECT * FROM MAIN WHERE NOTES MATCH '(\(value))'"
        } else {
            query = "SELECT * FROM MAIN WHERE LOCATION = ('\(value)');"
        }
        
        var statement: OpaquePointer? = nil  // Pointer for sql to track returns
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
            let date = stringAtField(statement!, fieldIndex: 0)
            let sleep = sqlite3_column_int(statement!, 1)
             let water = sqlite3_column_int(statement!, 2)
             let stress = sqlite3_column_int(statement!, 3)
             let exercise = sqlite3_column_int(statement!, 4)
            let location = stringAtField(statement!,fieldIndex: 5)
             let alcohol = sqlite3_column_int(statement!, 6)
            let mood = sqlite3_column_int(statement!, 7)
             let productivity = sqlite3_column_int(statement!, 8)
            let notes = stringAtField(statement!,fieldIndex: 9)
            let objectDate: String
            objectDate = String(date)
                     //  print(objectDate)
            let objectSleep: Int
            objectSleep = Int(sleep)
            let objectWater: Int
            objectWater = Int(water)
            let objectStress: Int
            objectStress = Int(stress)
            let objectExercise: Int
            objectExercise = Int(exercise)
            let objectLocation : String
            objectLocation = String(location)
            let objectAlcohol : Int
            objectAlcohol = Int(alcohol)
            let objectMood : Int
            objectMood = Int(mood)
            let objectProductivity: Int
            objectProductivity = Int(productivity)
            let objectNotes: String
            objectNotes = String(notes)
        
       var object = Mood(Date: objectDate, Sleep: objectSleep, Water: objectWater, Stress: objectStress, Exercise: objectExercise, Location: objectLocation, Alcohol: objectAlcohol, Mood: objectMood, Productivity: objectProductivity, Notes: objectNotes)
            print(object.Date)
            moodArray.append(object)
            }
            sqlite3_finalize(statement)
        }
            
            
            
            return moodArray
    }
    
    func getEntryActivities(date: String)-> [activityLog]{
        var activityRead: activityLog!
        var activityArray: [activityLog] = []
        let query = "SELECT * FROM ACTIVITYLOG WHERE DATE = ('\(date)');"
        var statement: OpaquePointer? = nil  // Pointer for sql to track returns
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
          while(sqlite3_step(statement) == SQLITE_ROW){
        let name = stringAtField(statement!, fieldIndex: 0)
        let length = sqlite3_column_int(statement!, 1)
           // let type = stringAtField(statement!, fieldIndex: <#T##Int#>)
        let description = stringAtField(statement!, fieldIndex: 3)
            
            let activityRead = activityLog(name: name,length: Int(length), description: description)
       //     print(activityRead.name)
         //   print(activityRead.description)
            activityArray.append(activityRead)
            print(activityArray[0].name)
         //   print(activityArray[1].name)
            
            
        
       // return moodArray
    }
        }
        return activityArray
    }
    
    
    
    
    func getLastEntry(){
       let query = "SELECT date FROM main WHERE DATE IN ( SELECT max( DATE) FROM main );"
        var statement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, query, -1, &statement, nil) == SQLITE_OK {
            while(sqlite3_step(statement) == SQLITE_ROW) {
                let date = sqlite3_column_int(statement!, 0)
                print(date)
            }
        }
        sqlite3_finalize(statement)
    }
    
    
    func getAllEntries() -> [Mood] {
        var entries: [Mood] = []
        let query = "SELECT * FROM MAIN"
        var statement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
            let date = stringAtField(statement!, fieldIndex: 0)
            let sleep = sqlite3_column_int(statement!, 1)
             let water = sqlite3_column_int(statement!, 2)
             let stress = sqlite3_column_int(statement!, 3)
             let exercise = sqlite3_column_int(statement!, 4)
            let location = stringAtField(statement!,fieldIndex: 5)
             let alcohol = sqlite3_column_int(statement!, 6)
            let mood = sqlite3_column_int(statement!, 7)
             let productivity = sqlite3_column_int(statement!, 8)
            let notes = stringAtField(statement!,fieldIndex: 9)
            let objectDate: String
                       objectDate = String(date)
                     //  print(objectDate)
                       let objectSleep: Int
                       objectSleep = Int(sleep)
                       let objectWater: Int
                       objectWater = Int(water)
                       let objectStress: Int
                       objectStress = Int(stress)
                       let objectExercise: Int
                       objectExercise = Int(exercise)
                       let objectLocation : String
                       objectLocation = String(location)
                       let objectAlcohol : Int
                       objectAlcohol = Int(alcohol)
                       let objectMood : Int
                       objectMood = Int(mood)
                       let objectProductivity: Int
                       objectProductivity = Int(productivity)
                       let objectNotes: String
                       objectNotes = String(notes)
                       
                       
                       var object = Mood(Date: objectDate, Sleep: objectSleep, Water: objectWater, Stress: objectStress, Exercise: objectExercise, Location: objectLocation, Alcohol: objectAlcohol, Mood: objectMood, Productivity: objectProductivity, Notes: objectNotes)
            print(object.Date)
            entries.append(object)
            }
        
        sqlite3_finalize(statement)
        }
        
        
        
        
        
        
        return entries
    }
    
    
    
    func createObject()  {
        let query = "SELECT * FROM MAIN WHERE DATE = '07-03-2020'"
            var object: Mood!
        var statement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
            let date = sqlite3_column_int(statement!, 0)
            let sleep = sqlite3_column_int(statement!, 1)
             let water = sqlite3_column_int(statement!, 2)
             let stress = sqlite3_column_int(statement!, 3)
             let exercise = sqlite3_column_int(statement!, 4)
            let location = stringAtField(statement!,fieldIndex: 5)
             let alcohol = sqlite3_column_int(statement!, 6)
            let mood = sqlite3_column_int(statement!, 8)
             let productivity = sqlite3_column_int(statement!, 9)
            let notes = stringAtField(statement!,fieldIndex: 7)
            
            let objectDate: String
            objectDate = String(date)
          //  print(objectDate)
            let objectSleep: Int
            objectSleep = Int(sleep)
            let objectWater: Int
            objectWater = Int(water)
            let objectStress: Int
            objectStress = Int(stress)
            let objectExercise: Int
            objectExercise = Int(exercise)
            let objectLocation : String
            objectLocation = String(location)
            let objectAlcohol : Int
            objectAlcohol = Int(alcohol)
            let objectMood : Int
            objectMood = Int(mood)
            let objectProductivity: Int
            objectProductivity = Int(productivity)
            let objectNotes: String
            objectNotes = String(notes)
            
            
            var object = Mood(Date: objectDate, Sleep: objectSleep, Water: objectWater, Stress: objectStress, Exercise: objectExercise, Location: objectLocation, Alcohol: objectAlcohol, Mood: objectMood, Productivity: objectProductivity, Notes: objectNotes)
            
            print(object.Sleep)
            print(object.Location)
            print(object.Notes)
//            print(date)
//            print(sleep)
//            print(water)
//            print(stress)
//            print(exercise)
//            print(location)
//            print(alcohol)
//            print(mood)
//            print(productivity)
//            print(notes)
        }
        }
            //return object

    }
    
       
    
    
    
    
    
    
    
    
    
}



