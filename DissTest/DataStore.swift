//
//  DataStore.swift
//  DataStore-SQLite-part1-Swift
//
//  Created by Neil Taylor on 15/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import Foundation
import SQLite3

class DataStore {

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
        
        let sqliteFilePath = documentsFolderPath + "table.db"
        
        if !FileManager.default.fileExists(atPath: sqliteFilePath) {
            let bundle = Bundle.main
            let bundlePath = bundle.path(forResource: "table", ofType: "db")
            
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
        let query =  "SELECT DATE FROM MAIN WHERE DATE = '07-03-2020'"
        var statement: OpaquePointer? = nil
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
            let first = stringAtField(statement!,fieldIndex: 0)
            print(first)
            }
            sqlite3_finalize(statement)
            
    }
    }
    
    
    func readRows(){
   // var entries: [String] = []
    let query = "SELECT * FROM MAIN;"
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
           let tester = Mood(Date: "", Sleep: 6, Water: 5, Stress: 3, Exercise: 6, Location: "Aber", Alcohol: 8, Mood: 9, Productivity: 10, Notes: "I Had a bad day")
        
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
    
    let deleteStatementString = "DELETE FROM MAIN WHERE DATE = '03-15-20'"
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
            

        
    
    
    
    
    
    
    
    
    
    
        
           
       

    
    
    /**
     * This version was presented in the lectures. An alternative version, below,
     * is currently linked into this version.
     */
    
    
//    func sessionItemListSimple() -> [SessionItem]? {
//
//        let query =
//           "Select id, title, content, dayId FROM SessionItem ORDER BY dayId, sessionOrder"
//
//        var statement: OpaquePointer? = nil
//
//        let result = sqlite3_prepare_v2(database, query, -1, &statement, nil)
//        if result == SQLITE_OK {
//            var resultList = [SessionItem]()
//
//            while sqlite3_step(statement) == SQLITE_ROW {
//
//                let sessionItem = SessionItem()
//                sessionItem.id = getTextValue(statement!, atColumnIndex: 0)
//                sessionItem.title = getTextValue(statement!, atColumnIndex: 1)
//                sessionItem.content = getTextValue(statement!, atColumnIndex: 2)
//                sessionItem.dayId = Int(sqlite3_column_int(statement, 3))
//                resultList.append(sessionItem)
//            }
//            sqlite3_finalize(statement)
//            return resultList
//        }
//        return nil
//    }
    
    /**
      This example shows how to run a query for the SessionItems. The query is
      more complex than the one shown in the lectures, because it also links in
      the associated location for the lecture.
     
      The method returns an array of SessionItem objects, where each SessionItem
      has an associated Location.
     */
//    func sessionItemList() -> [SessionItem]? {
//
//        let query = "SELECT S.id, title, content, dayId, L.id, L.name, L.latitude, L.longitude " +
//          " FROM SessionItem as S, Location as L WHERE S.locationId = L.id " +
//          " ORDER BY dayId, sessionOrder"
//
//        var statement: OpaquePointer? = nil
//
//        let result = sqlite3_prepare_v2(database, query, -1, &statement, nil)
//        if result == SQLITE_OK {
//            var resultList = [SessionItem]()
//
//            while sqlite3_step(statement) == SQLITE_ROW {
//
//                let sessionItem = SessionItem()
//                sessionItem.id = getTextValue(statement!, atColumnIndex: 0)
//                sessionItem.title = getTextValue(statement!, atColumnIndex: 1)
//                sessionItem.content = getTextValue(statement!, atColumnIndex: 2)
//                sessionItem.dayId = Int(sqlite3_column_int(statement, 3))
//
//                let location = Location()
//                location.id = getTextValue(statement!, atColumnIndex: 4)
//                location.title = getTextValue(statement!, atColumnIndex: 5)
//                location.latitude = Double(sqlite3_column_double(statement, 6))
//                location.longitude = Double(sqlite3_column_double(statement, 7))
//
//                sessionItem.location = location
//
//                resultList.append(sessionItem)
//            }
//
//            sqlite3_finalize(statement)
//
//            return resultList
//        }
//
//        return nil
//    }
    
    /**
      Example of preparing a statement to be sent to the database, which will
      make a change to the content of a database table. This example uses an
      Update statement. In addition to the COpaquePointer type, used for the
      statement, this extract also shows how to convert a Swift string into
      a UTF8String that is suitable for sending to SQLite.
     */
//    func modifyTitle(_ title: String, forId id: String) {
//
//        let query = "UPDATE SessionItem SET title = ? where id = ?"
//
//        var statement: OpaquePointer? = nil
//
//        if sqlite3_prepare_v2(database, query, -1, &statement, nil) == SQLITE_OK {
//
//            // the following two lines use (x as NSString).utf8String in order
//            // to convert the Swift String into a UTF8 String that will be
//            // understood by C.
//            sqlite3_bind_text(statement, 1, (title as NSString).utf8String, -1, nil)
//            sqlite3_bind_text(statement, 2, (id as NSString).utf8String, -1, nil)
//
//            if sqlite3_step(statement) != SQLITE_DONE {
//               hardFail("Unable to update the database")
//            }
//
//            sqlite3_finalize(statement)
//        }
//    }
//



