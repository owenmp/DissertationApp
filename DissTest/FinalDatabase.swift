//
//  FinalDatabase.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 16/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//




import Foundation
import SQLite3

class FinalDatabase {

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
     *Copies database to phone
     */
    fileprivate func prepareDatabasePath() -> String? {
        
        let documentsFolderPath =
           NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        
        let sqliteFilePath = documentsFolderPath + "/moodAppDatabase.db"
        
        if !FileManager.default.fileExists(atPath: sqliteFilePath) {
            let bundle = Bundle.main
            let bundlePath = bundle.path(forResource: "moodAppDatabase", ofType: "db")
            
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
    
    //allows string to be accessed from database
    func stringAtField(_ statementPointer: OpaquePointer, fieldIndex: Int ) -> String {
            var answer = "Error - DBAccess failed"
            if let rawString = sqlite3_column_text(statementPointer, Int32(fieldIndex) ) {
                answer = String(cString: rawString)
            }
            return answer
        }
    //test read
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
    
    //gets average alcohol value
    func getOverallAlcohol() -> Double {
          let query = "SELECT ALCOHOL FROM MAIN;"
          var average: Double = 0
          var statement: OpaquePointer? = nil
          var count: Double = 0
          if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
          while(sqlite3_step(statement) == SQLITE_ROW){
              let sleep = sqlite3_column_int(statement!, 0)
              average += Double(sleep)
              count += 1
              }
              sqlite3_finalize(statement)
              if count == 0 {
                  average = 0
              } else {
                  average /= count
              }
              print(average)
          }
              
          return average
              
      }
    
    //gets average water value
    func getOverallWater() -> Double {
          let query = "SELECT WATER FROM MAIN;"
          var average: Double = 0
          var statement: OpaquePointer? = nil
          var count: Double = 0
          if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
          while(sqlite3_step(statement) == SQLITE_ROW){
              let sleep = sqlite3_column_int(statement!, 0)
              average += Double(sleep)
              count += 1
              }
              sqlite3_finalize(statement)
              if count == 0 {
                  average = 0
              } else {
                  average /= count
              }
              print(average)
          }
              
          return average
              
      }
    
    
    //gets average exercise
    func getOverallExercise() -> Double {
          let query = "SELECT EXERCISEHOURS,EXERCISEMINUTES FROM MAIN;"
          var average: Double = 0
          var statement: OpaquePointer? = nil
          var count: Double = 0
        var minutes: Double = 0
          if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
          while(sqlite3_step(statement) == SQLITE_ROW){
              let sleep = sqlite3_column_int(statement!, 0)
            let minutesRead = sqlite3_column_int(statement!, 1)
              average += Double(sleep)
                minutes += Double(minutesRead)
              count += 1
              }
              sqlite3_finalize(statement)
              if count == 0 {
                  average = 0
              } else {
                  average /= count
                average *= 60
                minutes /= count
                minutes += average
                minutes /= 60
                average = minutes
              }
              print(average)
          }
              
          return average
              
      }
    
    
    //gets every date
    func getAllDates() -> [String]{
     let query = "SELECT DATE FROM MAIN;"
        var dates : [String] = []
        var statement: OpaquePointer? = nil
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
            let dateValue = getTextValue(statement!, atColumnIndex: 0)
            dates.append(dateValue!)
            
            
            }
    
        }
        return dates
    }
    
    //gets every mood value
    func getAllMood() -> [Int]{
      let query = "SELECT MOOD FROM MAIN;"
         var moods : [Int] = []
         var statement: OpaquePointer? = nil
         if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
         while(sqlite3_step(statement) == SQLITE_ROW){
             let moodValue = sqlite3_column_int(statement!, 0)
             moods.append(Int(moodValue))
             
             }
     
         }
         return moods
     }
    
   
    //gets sleep average
    func getOverallSleep() -> Double {
        let query = "SELECT SLEEPHOURS,SLEEPMINUTES FROM MAIN;"
        var average: Double = 0
        var statement: OpaquePointer? = nil
        var count: Double = 0
        var minutes: Double = 0
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
            let sleep = sqlite3_column_int(statement!, 0)
            let minutesRead = sqlite3_column_int(statement!, 1)
            average += Double(sleep)
            minutes += Double(minutesRead)
            count += 1
            }
            sqlite3_finalize(statement)
            if count == 0 {
                average = 0
            } else {
                average /= count
                average *= 60
                minutes /= count
                minutes += average
                minutes /= 60
                average = minutes
            }
            print(average)
        }
            
        return average
            
    }
    
    //gets alcohol average
    
    func getPoorAlcoholAverage () -> Double {
          let query = "SELECT ALCOHOL FROM MAIN WHERE MOOD < 4;"
          var averages: [Double] = []
          var statement: OpaquePointer? = nil
          var poorAverage: Double = 0
          var poorWater: Double = 0
          var count: Double = 0
          if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
          while(sqlite3_step(statement) == SQLITE_ROW){
          let waterRead = sqlite3_column_int(statement!, 0)
          poorWater += Double(waterRead)
              count += 1
              }
              sqlite3_finalize(statement)
              if count == 0 {
                  poorAverage = 0
              } else{
                  poorWater /= count
                  poorAverage = poorWater
              }
              print(poorAverage)
              
      }
          
          return poorAverage
          
      }
    
    //gets medium alcohol average
    
    func getMediumALCOHOLAverage () -> Double {
            let query = "SELECT ALCOHOL FROM MAIN WHERE MOOD BETWEEN 4 AND 6;"
            var averages: [Double] = []
            var statement: OpaquePointer? = nil
            var poorAverage: Double = 0
            var poorWater: Double = 0
            var count: Double = 0
            if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
            while(sqlite3_step(statement) == SQLITE_ROW){
            let waterRead = sqlite3_column_int(statement!, 0)
            poorWater += Double(waterRead)
                count += 1
                }
                sqlite3_finalize(statement)
                if count == 0 {
                    poorAverage = 0
                } else{
                    poorWater /= count
                    poorAverage = poorWater
                }
                print(poorAverage)
                
        }
           return poorAverage
           }
    
    
    
    //gets good alcohol average
    func getGoodAlcoholAverage () -> Double {
            let query = "SELECT ALCOHOL FROM MAIN WHERE MOOD > 7;"
            var averages: [Double] = []
            var statement: OpaquePointer? = nil
            var poorAverage: Double = 0
            var poorWater: Double = 0
            var count: Double = 0
            if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
            while(sqlite3_step(statement) == SQLITE_ROW){
            let waterRead = sqlite3_column_int(statement!, 0)
            poorWater += Double(waterRead)
                count += 1
                }
                sqlite3_finalize(statement)
                if count == 0 {
                    poorAverage = 0
                } else{
                    poorWater /= count
                    poorAverage = poorWater
                }
                print(poorAverage)
                
        }
           return poorAverage
       }
    
    //gets exercise average where mood is good
    
    func getGoodExerciseAverage () -> Double {
         let query = "SELECT EXERCISEHOURS,EXERCISEMINUTES FROM MAIN WHERE MOOD > 7;"
         var averages: [Double] = []
         var statement: OpaquePointer? = nil
         var poorAverage: Double = 0
         var poorWater: Double = 0
        var goodMinutes: Double = 0
         var count: Double = 0
         if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
         while(sqlite3_step(statement) == SQLITE_ROW){
         let waterRead = sqlite3_column_int(statement!, 0)
            let minutesRead = sqlite3_column_int(statement!, 1)
         poorWater += Double(waterRead)
            goodMinutes += Double(minutesRead)
             count += 1
             }
             sqlite3_finalize(statement)
             if count == 0 {
                 poorAverage = 0
             } else{
                 poorWater /= count
                 poorWater *= 60
                 goodMinutes /= count
                 goodMinutes += poorWater
                 goodMinutes /= 60
                 poorAverage = goodMinutes
             }
             print(poorAverage)
             
     }
        return poorAverage
    }
    
    
    //gets exercise average where mood is average
    func getMediumExerciseAverage () -> Double {
         let query = "SELECT EXERCISEHOURS,EXERCISEMINUTES FROM MAIN WHERE MOOD BETWEEN 4 AND 6;"
         var averages: [Double] = []
         var statement: OpaquePointer? = nil
         var poorAverage: Double = 0
         var poorWater: Double = 0
        var mediumMinutes: Double = 0
         var count: Double = 0
         if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
         while(sqlite3_step(statement) == SQLITE_ROW){
         let waterRead = sqlite3_column_int(statement!, 0)
         let minutesRead = sqlite3_column_int(statement!, 1)
         poorWater += Double(waterRead)
         mediumMinutes += Double(minutesRead)
             count += 1
             }
             sqlite3_finalize(statement)
             if count == 0 {
                 poorAverage = 0
             } else{
                poorWater /= count
                 poorWater *= 60
                 mediumMinutes /= count
                 mediumMinutes += poorWater
                 mediumMinutes /= 60
                 poorAverage = mediumMinutes
             }
             print(poorAverage)
             
     }
        return poorAverage
        }
    
    
    //gets exercise average where mood is poor
    func getPoorExerciseAverage () -> Double {
        let query = "SELECT EXERCISEHOURS,EXERCISEMINUTES FROM MAIN WHERE MOOD < 4;"
        var averages: [Double] = []
        var statement: OpaquePointer? = nil
        var poorAverage: Double = 0
        var poorWater: Double = 0
        var poorMinutes: Double = 0
        var count: Double = 0
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
        let waterRead = sqlite3_column_int(statement!, 0)
        poorWater += Double(waterRead)
        let minutesRead = sqlite3_column_int(statement!, 1)
            poorMinutes += Double(minutesRead)
            count += 1
            }
            sqlite3_finalize(statement)
            if count == 0 {
                poorAverage = 0
            } else{
                 poorWater /= count
                              poorWater *= 60
                              poorMinutes /= count
                              poorMinutes += poorWater
                              poorMinutes /= 60
                              poorAverage = poorMinutes
            }
            print(poorAverage)
            
    }
        
        return poorAverage
        
    }

    
    
    //gets sleeo average where mood is poor
    func getPoorSleepAverage () -> Double {
        let query = "SELECT SLEEPHOURS,SLEEPMINUTES FROM MAIN WHERE MOOD < 4;"
        var averages: [Double] = []
        var statement: OpaquePointer? = nil
        var poorAverage: Double = 0
        var poorWater: Double = 0
        var poorMinutes: Double = 0
        var count: Double = 0
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
        let waterRead = sqlite3_column_int(statement!, 0)
        let minutesRead = sqlite3_column_int(statement!, 1)
        poorWater += Double(waterRead)
            poorMinutes += Double(minutesRead)
            count += 1
            }
            sqlite3_finalize(statement)
            if count == 0 {
                poorAverage = 0
            } else{
                poorWater /= count
                poorWater *= 60
                poorMinutes /= count
                poorMinutes += poorWater
                poorMinutes /= 60
                poorAverage = poorMinutes
            }
            print(poorAverage)
            
    }
        
        return poorAverage
        
    }
    
    //gets sleep average where mood is poor
    func getMediumSleepAverage () -> Double {
        let query = "SELECT SLEEPHOURS,SLEEPMINUTES FROM MAIN WHERE MOOD BETWEEN 4 AND 6;"
        var averages: [Double] = []
        var statement: OpaquePointer? = nil
        var mediumAverage: Double = 0
        var mediumWater: Double = 0
        var mediumMinutes: Double = 0
        var count: Double = 0
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
        let waterRead = sqlite3_column_int(statement!, 0)
        let minutesRead = sqlite3_column_int(statement!, 1)
        mediumWater += Double(waterRead)
            mediumMinutes += Double(minutesRead)
            count += 1
            }
            sqlite3_finalize(statement)
            if count == 0 {
                mediumAverage = 0
            } else{
                mediumWater /= count
                mediumWater *= 60
                mediumMinutes /= count
                mediumMinutes += mediumWater
                mediumMinutes /= 60
                mediumAverage = mediumMinutes
            }
            print(mediumAverage)
            
    }
        
        return mediumAverage
        
    }
    
    //gets sleep average where mood is good
    func getGoodSleepAverage () -> Double {
        let query = "SELECT SLEEPHOURS,SLEEPMINUTES FROM MAIN WHERE MOOD > 7"
        var averages: [Double] = []
        var statement: OpaquePointer? = nil
        var mediumAverage: Double = 0
        var mediumWater: Double = 0
        var mediumMinutes: Double = 0
        var count: Double = 0
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
        let waterRead = sqlite3_column_int(statement!, 0)
        let minuteRead = sqlite3_column_int(statement!, 1)
        mediumWater += Double(waterRead)
        mediumMinutes += Double(minuteRead)
            count += 1
            }
            sqlite3_finalize(statement)
            if count == 0 {
                mediumAverage = 0
            } else{
                mediumWater /= count
                mediumWater *= 60
                mediumMinutes /= count
                mediumMinutes += mediumWater
                mediumMinutes /= 60
                mediumAverage = mediumMinutes
            }
            print(mediumAverage)
            
    }
        
        return mediumAverage
        
    }
    
    //gets water average where mood is good
    func getGoodAverage () -> Double {
           let query = "SELECT WATER FROM MAIN WHERE MOOD > 7"
           var averages: [Double] = []
           var statement: OpaquePointer? = nil
           var mediumAverage: Double = 0
           var mediumWater: Double = 0
           var count: Double = 0
           if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
           while(sqlite3_step(statement) == SQLITE_ROW){
           let waterRead = sqlite3_column_int(statement!, 0)
           mediumWater += Double(waterRead)
               count += 1
               }
               sqlite3_finalize(statement)
               if count == 0 {
                   mediumAverage = 0
               } else{
                   mediumWater /= count
                   mediumAverage = mediumWater
               }
               print(mediumAverage)
               
       }
           
           return mediumAverage
           
       }
    
    
    //gets water average where mood is average
    func getMediumAverage () -> Double {
           let query = "SELECT WATER FROM MAIN WHERE MOOD BETWEEN 4 AND 6;"
           var averages: [Double] = []
           var statement: OpaquePointer? = nil
           var mediumAverage: Double = 0
           var mediumWater: Double = 0
           var count: Double = 0
           if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
           while(sqlite3_step(statement) == SQLITE_ROW){
           let waterRead = sqlite3_column_int(statement!, 0)
           mediumWater += Double(waterRead)
               count += 1
               }
               sqlite3_finalize(statement)
               if count == 0 {
                   mediumAverage = 0
               } else{
                   mediumWater /= count
                   mediumAverage = mediumWater
               }
               print(mediumAverage)
               
       }
           
           return mediumAverage
           
       }
    
    
    //gets symptoms from specific date
    func getSymptoms(date: String) -> [Symptom] {
        var symptoms : [Symptom] = []
        var statement: OpaquePointer? = nil
        let query = "SELECT * FROM SYMPTOMS WHERE DATE = '\(date)';"
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
            var objectDate = date
            var name = stringAtField(statement!, fieldIndex: 1)
            var drugs = stringAtField(statement!, fieldIndex: 2)
            var description = stringAtField(statement!, fieldIndex: 3)
            var objectSymptom = Symptom(Date: date, Name: name, Description: description, Drugs: drugs)
            symptoms.append(objectSymptom)

            
            }
            sqlite3_finalize(statement)
            
        }
        return symptoms
    }
    
    //gets plan from specific date
    
    func getPlan(date: String) -> [ActivityPlan] {
        var plan : [ActivityPlan] = []
        var statement: OpaquePointer? = nil
        let query = "SELECT * FROM DAILYPLAN WHERE DATE = '\(date)'"
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
            var objectDate = date
            var name = stringAtField(statement!, fieldIndex: 1)
            var description = stringAtField(statement!, fieldIndex: 2)
            var completed = sqlite3_column_int(statement!, 3)
            var objectCompleted = Int(completed)
            
            var objectPlan = ActivityPlan(date: date, name: name, description: description, completed: objectCompleted)
            
            plan.append(objectPlan)
            print(objectPlan.description)
            
            
            
            
            }
            sqlite3_finalize(statement)
        }
    
        
        
        return plan
    }
    
    
    
    
    
    //gets all dates with a plan
    func getPlanDates() -> [String] {
        var dates : [String] = []
        var statement: OpaquePointer? = nil
        let query = "SELECT DISTINCT DATE FROM DAILYPLAN"
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
            var dateRead = stringAtField(statement!, fieldIndex: 0)
            dates.append(dateRead)
            }
            sqlite3_finalize(statement)
        }
        return dates
    }
    //gets water where mood is poor
    func getPoorWaterAverage () -> Double {
        let query = "SELECT WATER FROM MAIN WHERE MOOD < 4;"
        var averages: [Double] = []
        var statement: OpaquePointer? = nil
        var poorAverage: Double = 0
        var poorWater: Double = 0
        var count: Double = 0
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
        let waterRead = sqlite3_column_int(statement!, 0)
        poorWater += Double(waterRead)
            count += 1
            }
            sqlite3_finalize(statement)
            if count == 0 {
                poorAverage = 0
            } else{
                poorWater /= count
                poorAverage = poorWater
            }
            print(poorAverage)
            
    }
        
        return poorAverage
        
    }
    
    
    
    
//    func getWaterAverages() -> [Double] {
//
//
//        let query1 = "SELECT WATER FROM MAIN WHERE MOOD < 4;"
//        let query2 = "SELECT WATER FROM MAIN WHERE MOOD BETWEEN 4 AND 6;"
//        let query3 = "SELECT WATER FROM MAIN WHERE MOOD > 7;"
//        var queryArray : [String] = []
//        queryArray.append(query1)
//        queryArray.append(query2)
//        queryArray.append(query3)
//        var poor: Double = 0
//        var medium: Double = 0
//        var good:Double  = 0
//        var averagesRead: [Double] = []
//        var count: Double = 0
//        averagesRead.append(poor)
//        averagesRead.append(medium)
//        averages.append(poor)
//
//        for i in 0...2 {
//            if sqlite3_prepare_v2( database, queryArray[i], -1, &statement, nil) == SQLITE_OK {
//            while(sqlite3_step(statement) == SQLITE_ROW){
//                let waterRead = sqlite3_column_int(statement!, 0)
//
//                //var read = averagesRead[i]
//                medium += Double(waterRead)
//                count += 1
//                medium /= count
//                poor = medium
//                averages.append(poor)
//                print(read)
//                }
//                sqlite3_finalize(statement)
//            }
//
//
//
//
//        }
//
//
//
//
//        return averages
//
//    }
    
    //get dates of activities
    func getActivityDates (name: String) -> [String] {
        var dates : [String] = []
        var statement: OpaquePointer? = nil
        var query = "SELECT DISTINCT DATE FROM ACTIVITYLOG WHERE NAME = '\(name)';"
        
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
            let readDate = stringAtField(statement!, fieldIndex: 0)
            dates.append(readDate)
            }
            sqlite3_finalize(statement)
        }
        return dates
    }
    
    
    
    
    //sgets all complete goals
    func getCompleteGoals(dates: [String])  {
        var completeGoals: [String] = []
        var total = 0
        var array: [String] = []
        var statement: OpaquePointer? = nil
        var query = "SELECT COMPLETED, DATE FROM DAILYPLAN;"
        for date in dates {
            var count = 0
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
            var completedRead = sqlite3_column_int(statement, 0)
            var date = stringAtField(statement!, fieldIndex: 1)
            var array: [Int] = []
            total += Int(completedRead)
           // var count = 0
            
            count += 1
            }
            
            
            }
            if total == count {
                array.append(date)
                print(date)
                print("added")
            
                
            } else {
                print("None added")
            }
            
            
            
    
            
            
        }
        
        
        
        
        
    }
    
    
    //gets bar chart values
    func getBarActivityAverage(dates: [String]) -> [Int] {
        var averages: [Int] = []
        var statement: OpaquePointer? = nil
        var mood = 0
        var stress = 0
        var productivity = 0
        var count = 0
        for date in dates {
        
        var query = "SELECT MOOD,STRESS,PRODUCTIVITY FROM MAIN WHERE DATE = '\(date)';"
            
            if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
                   while(sqlite3_step(statement) == SQLITE_ROW){
                   let moodRead = sqlite3_column_int(statement!, 0)
                   let stressRead = sqlite3_column_int(statement!, 1)
                   let productivityRead = sqlite3_column_int(statement!, 2)
                              
                   mood += Int(moodRead)
                   stress += Int(stressRead)
                   productivity += Int(productivityRead)
                   count += 1
        }
                
            }
            sqlite3_finalize(statement)
                if count == 0 {
                    mood = 0
                    stress = 0
                    productivity = 0
                    averages.append(mood)
                    averages.append(stress)
                    averages.append(productivity)
                } else {
                    mood /= count
                    stress /= count
                    productivity /= count
                    averages.append(mood)
                    averages.append(stress)
                    averages.append(productivity)
                }
                print(averages)
            }
    return averages
    }
    
    
    //get sleep or exercises averages for bar chart
    func getBarSleepOrExercise (search: String, hours: String, minutes: String) -> [Int] {
        var query = ""
        var averages: [Int] = []
        var statement: OpaquePointer? = nil
        if search == "Sleep" {
            query = "SELECT MOOD,STRESS,PRODUCTIVITY FROM MAIN WHERE SLEEPHOURS = '\(hours)' AND SLEEPMINUTES = '\(minutes)';"
        }else if search == "Exercise" {
            query = "SELECT MOOD,STRESS,PRODUCTIVITY FROM MAIN WHERE EXERCISEHOURS = '\(hours)' AND EXERCISEMINUTES = '\(minutes)';"
            
        }
        var mood = 0
        var stress = 0
        var productivity = 0
        var count = 0
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
        let moodRead = sqlite3_column_int(statement!, 0)
        let stressRead = sqlite3_column_int(statement!, 1)
        let productivityRead = sqlite3_column_int(statement!, 2)
                   
        mood += Int(moodRead)
        stress += Int(stressRead)
        productivity += Int(productivityRead)
        count += 1
                }
                   sqlite3_finalize(statement)
                   if count == 0 {
                       mood = 0
                       stress = 0
                       productivity = 0
                       averages.append(mood)
                       averages.append(stress)
                       averages.append(productivity)
                   } else {
                       mood /= count
                       stress /= count
                       productivity /= count
                       averages.append(mood)
                       averages.append(stress)
                       averages.append(productivity)
                   }
                   print(averages)
               }
        return averages
    }
    
    
    
    
    //gets bar averages
    func getBarAverages(search: String, value: String) -> [Int] {
        var averages: [Int] = []
        var statement: OpaquePointer? = nil
        let query = "SELECT MOOD,STRESS,PRODUCTIVITY FROM MAIN WHERE (\(search)) = ('\(value)') COLLATE NOCASE;"
        var mood = 0
        var stress = 0
        var productivity = 0
        var count = 0
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
            let moodRead = sqlite3_column_int(statement!, 0)
            let stressRead = sqlite3_column_int(statement!, 1)
            let productivityRead = sqlite3_column_int(statement!, 2)
            
            mood += Int(moodRead)
            stress += Int(stressRead)
            productivity += Int(productivityRead)
            count += 1
            }
            sqlite3_finalize(statement)
            if count == 0 {
                mood = 0
                stress = 0
                productivity = 0
                averages.append(mood)
                averages.append(stress)
                averages.append(productivity)
            } else {
                mood /= count
                stress /= count
                productivity /= count
                averages.append(mood)
                averages.append(stress)
                averages.append(productivity)
            }
            print(averages)
        }
            return averages
            
            
        
        
    }
    
    
    //gets pie averages
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
    //gets all activities
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
    //inserts activitiy to database
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
    
    
    //checks if entry is completed
    func checkEntryComplete(date: String) -> Bool  {
        var query = "SELECT DATE FROM MAIN WHERE DATE = '\(date)';"
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(database,query , -1, &statement, nil) == SQLITE_OK {
                  while (sqlite3_step(statement) == SQLITE_ROW) {
                    let dateRead = stringAtField(statement!, fieldIndex: 0)
                    if date == String(dateRead){
                    sqlite3_finalize(statement)
                    return true
                    } else {
                        sqlite3_finalize(statement)
                        return false
                    }
            }
            
        }
        sqlite3_finalize(statement)
        
        return false
        
    }
    
    //sets goal to complete
    func setCompleteGoal(goal: ActivityPlan) {
        var query = "UPDATE DailyPlan set COMPLETED = 1 WHERE DATE = '\(goal.date)' AND NAME = '\(goal.name)' AND DESCRIPTION = '\(goal.description)';"
        var updateStatement: OpaquePointer?
        if sqlite3_prepare_v2(database, query, -1, &updateStatement, nil) == SQLITE_OK {
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                print("Row Inserted")
            } else {
                print("Couldnt insert row")
            }
        } else {
            ("Statement not prepared")
        }
        sqlite3_finalize(updateStatement)
    }
    
    //sets goal to incomplete
    func setIncompleteGoal(goal: ActivityPlan) {
          var query = "UPDATE DailyPlan set COMPLETED = 0 WHERE DATE = '\(goal.date)' AND NAME = '\(goal.name)' AND DESCRIPTION = '\(goal.description)';"
          var updateStatement: OpaquePointer?
          if sqlite3_prepare_v2(database, query, -1, &updateStatement, nil) == SQLITE_OK {
              if sqlite3_step(updateStatement) == SQLITE_DONE {
                  print("Row Inserted")
              } else {
                  print("Couldnt insert row")
              }
          } else {
              ("Statement not prepared")
          }
          sqlite3_finalize(updateStatement)
      }
    
    
    
    
    
   let l = "INSERT INTO ACTIVITYLOg (NAME,HOURS,MINUTES,DATE,DESCRIPTION) VALUES (?,?,?,?,?);"
    //adds new goal to database
    func addNewGoal(goal : ActivityPlan) {
        var insertStatement: OpaquePointer?
        let insertGoalStatement = "INSERT INTO DailyPlan (DATE,NAME,DESCRIPTION,COMPLETED) VALUES (?,?,?,?);"
        if sqlite3_prepare_v2(database,insertGoalStatement, -1, &insertStatement, nil) == SQLITE_OK {
            let insertedDate = goal.date as NSString
            let insertedName = goal.name as NSString
            let insertedDescription = goal.description as NSString
            sqlite3_bind_text(insertStatement, 1, insertedDate.utf8String, -1, SQLITE_TRANSIENT)
            sqlite3_bind_text(insertStatement, 2, insertedName.utf8String, -1, SQLITE_TRANSIENT)
            sqlite3_bind_text(insertStatement, 3, insertedDescription.utf8String, -1, SQLITE_TRANSIENT)
            sqlite3_bind_int(insertStatement, 4, Int32(goal.completed))
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("\nSuccessfully inserted row.")
              } else {
                print("\nCould not insert row.")
              }
            } else {
              print("\nINSERT statement is not prepared.")
            }
            sqlite3_finalize(insertStatement)
            
        
    }
    
    //adds new symptom to database
    func addNewSymptom(symptom: Symptom){
        var insertStatement: OpaquePointer?
        let insertSymptomStatement = "INSERT INTO SYMPTOMS (DATE,NAME,DRUGS,DESCRIPTION) VALUES (?,?,?,?);"
        if sqlite3_prepare_v2(database,insertSymptomStatement, -1, &insertStatement, nil) == SQLITE_OK {
            let insertedDate = symptom.date as NSString
            let insertedName = symptom.Name as NSString
            let insertedDrug = symptom.Drugs as NSString
            let insertedDescription = symptom.Description as NSString
            sqlite3_bind_text(insertStatement, 1, insertedDate.utf8String, -1, SQLITE_TRANSIENT)
            sqlite3_bind_text(insertStatement, 2, insertedName.utf8String, -1, SQLITE_TRANSIENT)
            sqlite3_bind_text(insertStatement, 3, insertedDrug.utf8String, -1, SQLITE_TRANSIENT)
            sqlite3_bind_text(insertStatement, 4, insertedDescription.utf8String, -1, SQLITE_TRANSIENT)
        if sqlite3_step(insertStatement) == SQLITE_DONE {
            print("\nSuccessfully inserted row.")
          } else {
            print("\nCould not insert row.")
          }
        } else {
          print("\nINSERT statement is not prepared.")
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
   
    
//
//        func insertTestObject(){
//           var statement : OpaquePointer?
//           let tester = Mood(Date: "17-03-2020", Sleep: 6, Water: 5, Stress: 3, Exercise: 6, Location: "Aber", Alcohol: 8, Mood: 9, Productivity: 10, Notes: "I Had a bad day")
//
//         if sqlite3_prepare_v2(database,insertStatementString2, -1, &statement, nil) == SQLITE_OK {
//            let date : NSString = tester.Date as NSString
//            sqlite3_bind_text(statement, 1, date.utf8String, -1, SQLITE_TRANSIENT)
//            sqlite3_bind_int(statement, 2, Int32(tester.Sleep))
//            sqlite3_bind_int(statement, 3, Int32(tester.Water))
//            sqlite3_bind_int(statement, 4, Int32(tester.Stress))
//            sqlite3_bind_int(statement, 5, Int32(tester.Exercise))
//            let hello : NSString = tester.Location as NSString
//            sqlite3_bind_text(statement, 6, hello.utf8String,-1,SQLITE_TRANSIENT)
//            let notes: NSString = tester.Notes as NSString
//            sqlite3_bind_int(statement, 7, Int32(tester.Alcohol))
//            sqlite3_bind_text(statement, 8, notes.utf8String,-1,SQLITE_TRANSIENT)
//            sqlite3_bind_int(statement, 9, Int32(tester.Mood))
//           sqlite3_bind_int(statement, 10, Int32(tester.Productivity))
//            if sqlite3_step(statement) == SQLITE_DONE {
//                 print("\nSuccessfully inserted row.")
//               } else {
//                 print("\nCould not insert row.")
//               }
//             } else {
//               print("\nINSERT statement is not prepared.")
//            //inser notes isn't working
//
//        }
//        sqlite3_finalize(statement)
//    }
//
    
    //inserts to activity log
    func insertDailyActivities(dailyActivities: [activityLog], date: String){
        var statement: OpaquePointer?
        var insertActivityStatement = "INSERT INTO ACTIVITYLOG (NAME,HOURS,MINUTES,DATE,DESCRIPTION) VALUES (?,?,?,?,?);"
        for i in dailyActivities{
        if sqlite3_prepare_v2(database,insertActivityStatement, -1, &statement, nil) == SQLITE_OK {
            let nameString: NSString = i.name as NSString
            let descriptionString: NSString = i.description as NSString
            let dateString: NSString = date as NSString
            sqlite3_bind_text(statement, 1, nameString.utf8String, -1, SQLITE_TRANSIENT)
            sqlite3_bind_int(statement, 2, Int32(i.length))
            sqlite3_bind_int(statement, 3, Int32(i.minutes))
            sqlite3_bind_text(statement, 4, dateString.utf8String, -1, SQLITE_TRANSIENT)
            sqlite3_bind_text(statement, 5, descriptionString.utf8String, -1, SQLITE_TRANSIENT)
            
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
        
    
    
    let insertStatementString2 = "INSERT INTO MAIN (DATE,SLEEPHOURS,WATER,STRESS,EXERCISEHOURS,LOCATION,ALCOHOL,NOTES,MOOD,PRODUCTIVITY,EXERCISEMINUTES,SLEEPMINUTES) VALUES (?,?,?,?,?,?,?,?,?,?,?,?);"

    
    //inserts daily entry
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
            sqlite3_bind_int(statement,11,Int32(dailyEntry.ExerciseMinutes))
            sqlite3_bind_int(statement,12,Int32(dailyEntry.SleepMinutes))
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
    
    //gets all activities
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
    
    
    
    func getScatterDates(filter: String, value: Int) -> [String]{
           var moodArray: [Mood] = []
           var moodValue: [String] = []
           var query = "SELECT * FROM MAIN WHERE (\(filter)) = (\(value));"
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

           var object = Mood(Date: objectDate, Sleep: objectSleep, Water: objectWater, Stress: objectStress, Exercise: objectExercise, Location: objectLocation, Alcohol: objectAlcohol, Mood: objectMood, Productivity: objectProductivity, Notes: objectNotes,SleepMinutes: 0, ExerciseMinutes: 0)
               print(object.Date)
               moodArray.append(object)
               moodValue.append(object.Date)
                       }
                       sqlite3_finalize(statement)
                   }



                       return moodValue
               }
    
    
    
    func getScatterData(filter: String, value: Int) -> [Int]{
        var moodArray: [Mood] = []
        var moodValue: [Int] = []
        var query = "SELECT * FROM MAIN WHERE (\(filter)) = (\(value));"
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

        var object = Mood(Date: objectDate, Sleep: objectSleep, Water: objectWater, Stress: objectStress, Exercise: objectExercise, Location: objectLocation, Alcohol: objectAlcohol, Mood: objectMood, Productivity: objectProductivity, Notes: objectNotes,SleepMinutes: 0, ExerciseMinutes: 0)
            print(object.Date)
            moodArray.append(object)
            moodValue.append(object.Mood)
                    }
                    sqlite3_finalize(statement)
                }



                    return moodValue
            }
    
    
    //deletes goal from database
    func deleteGoal(goal: ActivityPlan) {
         var deleteStatement: OpaquePointer?
         var nameForDelete = ""
         nameForDelete = goal.name
         var dateForDelete = goal.date
         var descriptionForDelete = goal.description
        var completionForDelete = goal.completed
         
         var deleteStatementString = "DELETE FROM DailyPlan WHERE DATE = '\(dateForDelete)' AND NAME = '\(nameForDelete)' AND DESCRIPTION = '\(descriptionForDelete)' AND COMPLETED = \(completionForDelete);"
       if sqlite3_prepare_v2(database, deleteStatementString, -1, &deleteStatement, nil) ==
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
    
    
    
    
    
    
    
    //deletes symptom from database
    func deleteSymptom(symptom: Symptom) {
        var deleteStatement: OpaquePointer?
        var nameForDelete = ""
        nameForDelete = symptom.Name
        var dateForDelete = symptom.date
        var descriptionForDelete = symptom.Description
        var drugForDelete = symptom.Drugs
        var deleteStatementString = "DELETE FROM SYMPTOMS WHERE DATE = '\(dateForDelete)' AND NAME = '\(nameForDelete)' AND DRUGS = '\(drugForDelete)' AND DESCRIPTION = '\(descriptionForDelete)';"
      if sqlite3_prepare_v2(database, deleteStatementString, -1, &deleteStatement, nil) ==
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
    
    
    
    //searches activities
    func getSearchedActivities(dates: [String]) -> [Mood] {
        var moodArray: [Mood] = []
        var statement: OpaquePointer? = nil
        
        for i in dates {
            var query = "SELECT * FROM MAIN WHERE DATE = '\(i)';"
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
                     let exerciseMinutes = sqlite3_column_int(statement!, 10)
                     let sleepMinutes = sqlite3_column_int(statement!, 11)
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
                     let objectExerciseMins: Int
                     objectExerciseMins = Int(exerciseMinutes)
                     let objectSleepMins: Int
                     objectSleepMins = Int(sleepMinutes)
                     
                 
                var object = Mood(Date: objectDate, Sleep: objectSleep, Water: objectWater, Stress: objectStress, Exercise: objectExercise, Location: objectLocation, Alcohol: objectAlcohol, Mood: objectMood, Productivity: objectProductivity, Notes: objectNotes, SleepMinutes: objectSleepMins, ExerciseMinutes: objectExerciseMins)
                     print(object.Date)
                     moodArray.append(object)
                }
            }
            sqlite3_finalize(statement)
        }
         return moodArray
    }
        
        
        
        
        
    
    
    
    //gets dates where activity name =
    func getActivityDates(activityName: String) -> [String]{
        var dates: [String] = []
        var query = "SELECT DISTINCT DATE FROM ACTIVITYLOG WHERE NAME = '\(activityName)' COLLATE NOCASE;"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
            let readDate = stringAtField(statement!, fieldIndex: 0)
            dates.append(readDate)
            }
            sqlite3_finalize(statement)
        }
        return dates
    }
    
    
    
    //searches notes from mood entries
    func searchNotes(hours: String) -> [Mood] {
             var moodArray: [Mood] = []
             var query = "SELECT * FROM MAIN WHERE NOTES LIKE '%\(hours)%';"
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
                        let exerciseMinutes = sqlite3_column_int(statement!, 10)
                        let sleepMinutes = sqlite3_column_int(statement!, 11)
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
                        let objectExerciseMins: Int
                        objectExerciseMins = Int(exerciseMinutes)
                        let objectSleepMins: Int
                        objectSleepMins = Int(sleepMinutes)
                        
                    
                   var object = Mood(Date: objectDate, Sleep: objectSleep, Water: objectWater, Stress: objectStress, Exercise: objectExercise, Location: objectLocation, Alcohol: objectAlcohol, Mood: objectMood, Productivity: objectProductivity, Notes: objectNotes, SleepMinutes: objectSleepMins, ExerciseMinutes: objectExerciseMins)
                        print(object.Date)
                        moodArray.append(object)
                        }
                        sqlite3_finalize(statement)
                    }
                        
             
             
             return moodArray
         }
    
    
    
    //searcehes mood entries used exercise values
    func searchExercise(hours: String, minutes: String) -> [Mood] {
          var moodArray: [Mood] = []
          var query = "SELECT * FROM MAIN WHERE EXERCISEHOURS = '\(hours)' AND EXERCISEMINUTES = '\(minutes)';"
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
                     let exerciseMinutes = sqlite3_column_int(statement!, 10)
                     let sleepMinutes = sqlite3_column_int(statement!, 11)
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
                     let objectExerciseMins: Int
                     objectExerciseMins = Int(exerciseMinutes)
                     let objectSleepMins: Int
                     objectSleepMins = Int(sleepMinutes)
                     
                 
                var object = Mood(Date: objectDate, Sleep: objectSleep, Water: objectWater, Stress: objectStress, Exercise: objectExercise, Location: objectLocation, Alcohol: objectAlcohol, Mood: objectMood, Productivity: objectProductivity, Notes: objectNotes, SleepMinutes: objectSleepMins, ExerciseMinutes: objectExerciseMins)
                     print(object.Date)
                     moodArray.append(object)
                     }
                     sqlite3_finalize(statement)
                 }
                     
          
          
          return moodArray
      }
    
    
        //gets dates of bad moods
        func getBadDates() -> [String] {
            var finalActivities: [String] = []
            let queryForDates = "SELECT DATE FROM MAIN WHERE MOOD < 4;"
            var dates: [String] = []
            var dateForSearch: String = ""
            let queryForActivities = "SELECT NAME FROM ActivityLog WHERE DATE = '\(dateForSearch)'; "
            var statement: OpaquePointer? = nil
            var statement2: OpaquePointer? = nil
            // Pointer for sql to track returns
            if sqlite3_prepare_v2( database, queryForDates, -1, &statement, nil) == SQLITE_OK {
                while(sqlite3_step(statement) == SQLITE_ROW){
                    let date = stringAtField(statement!, fieldIndex: 0)
                    dates.append(date)
                }
                        }
            sqlite3_finalize(statement)
        
        return dates
    }

    //gets date of good moves
    func getGoodDates() -> [String] {
        var finalActivities: [String] = []
        let queryForDates = "SELECT DATE FROM MAIN WHERE MOOD > 7;"
        var dates: [String] = []
        var dateForSearch: String = ""
        let queryForActivities = "SELECT NAME FROM ActivityLog WHERE DATE = '\(dateForSearch)'; "
        var statement: OpaquePointer? = nil
        var statement2: OpaquePointer? = nil
        // Pointer for sql to track returns
        if sqlite3_prepare_v2( database, queryForDates, -1, &statement, nil) == SQLITE_OK {
            while(sqlite3_step(statement) == SQLITE_ROW){
                let date = stringAtField(statement!, fieldIndex: 0)
                dates.append(date)
            }
                    }
        sqlite3_finalize(statement)
    
    return dates
}
    
    //gets symptoms from dates with bad moods
    func getBadSymptoms(dates: [String]) -> [String]{
           var symptoms: [String] = []
           var dateForSearch: String = ""
           var statement: OpaquePointer? = nil
           
           for i in dates {
               dateForSearch = i
               let queryForActivities = "SELECT NAME FROM SYMPTOMS WHERE DATE = '\(dateForSearch)';"
               if sqlite3_prepare_v2( database, queryForActivities, -1, &statement, nil) == SQLITE_OK {
               while(sqlite3_step(statement) == SQLITE_ROW){
                   let name = stringAtField(statement!, fieldIndex: 0)
                   symptoms.append(name)
           }
               }
               sqlite3_finalize(statement)
           }
           
           
           
           return symptoms
       }
    
    
    //gets activity from dates with good moods
    func getGoodActivities(dates: [String]) -> [String]{
        var activities: [String] = []
        var dateForSearch: String = ""
        var statement: OpaquePointer? = nil
        
        for i in dates {
            dateForSearch = i
            let queryForActivities = "SELECT NAME FROM ActivityLog WHERE DATE = '\(dateForSearch)';"
            if sqlite3_prepare_v2( database, queryForActivities, -1, &statement, nil) == SQLITE_OK {
            while(sqlite3_step(statement) == SQLITE_ROW){
                let name = stringAtField(statement!, fieldIndex: 0)
                activities.append(name)
        }
            }
            sqlite3_finalize(statement)
        }
        
        
        
        return activities
    }
    
    
   
    
    
    //searches sleep values returns mood entries
    func searchSleep(hours: String, minutes: String) -> [Mood] {
        var moodArray: [Mood] = []
        var query = "SELECT * FROM MAIN WHERE SLEEPHOURS = '\(hours)' AND SLEEPMINUTES = '\(minutes)';"
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
                   let exerciseMinutes = sqlite3_column_int(statement!, 10)
                   let sleepMinutes = sqlite3_column_int(statement!, 11)
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
                   let objectExerciseMins: Int
                   objectExerciseMins = Int(exerciseMinutes)
                   let objectSleepMins: Int
                   objectSleepMins = Int(sleepMinutes)
                   
               
              var object = Mood(Date: objectDate, Sleep: objectSleep, Water: objectWater, Stress: objectStress, Exercise: objectExercise, Location: objectLocation, Alcohol: objectAlcohol, Mood: objectMood, Productivity: objectProductivity, Notes: objectNotes, SleepMinutes: objectSleepMins, ExerciseMinutes: objectExerciseMins)
                   print(object.Date)
                   moodArray.append(object)
                   }
                   sqlite3_finalize(statement)
               }
                   
        
        
        return moodArray
    }
    
    
    //searches entries and returns mood entries
    func searchEntries(filter: String, value: String) -> [Mood]{
       // var moodRead: Mood!
        var moodArray: [Mood] = []
        var query = ""
        var percent = "%"
        if filter == "Mood" || filter == "Stress" || filter == "Productivity" || filter == "ExerciseHours" || filter == "SleepHours" || filter == "Alcohol" || filter == "Water" {
             query = "SELECT * FROM MAIN WHERE (\(filter)) = (\(value));"
        } else if filter == "Notes"{
            percent += value
            percent += percent
            
             query = "SELECT * FROM MAIN WHERE NOTES like '(\(percent))'"
        } else {
            query = "SELECT * FROM MAIN WHERE LOCATION = ('\(value)') COLLATE NOCASE;"
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
            let exerciseMinutes = sqlite3_column_int(statement!, 10)
            let sleepMinutes = sqlite3_column_int(statement!, 11)
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
            let objectExerciseMins: Int
            objectExerciseMins = Int(exerciseMinutes)
            let objectSleepMins: Int
            objectSleepMins = Int(sleepMinutes)
            
        
       var object = Mood(Date: objectDate, Sleep: objectSleep, Water: objectWater, Stress: objectStress, Exercise: objectExercise, Location: objectLocation, Alcohol: objectAlcohol, Mood: objectMood, Productivity: objectProductivity, Notes: objectNotes, SleepMinutes: objectSleepMins, ExerciseMinutes: objectExerciseMins)
            print(object.Date)
            moodArray.append(object)
            }
            sqlite3_finalize(statement)
        }
            
            
            
            return moodArray
    }
    
    //gets activities from spcific date
    func getEntryActivities(date: String)-> [activityLog]{
        var activityRead: activityLog!
        var activityArray: [activityLog] = []
        let query = "SELECT * FROM ACTIVITYLOG WHERE DATE = ('\(date)');"
        var statement: OpaquePointer? = nil  // Pointer for sql to track returns
        if sqlite3_prepare_v2( database, query, -1, &statement, nil) == SQLITE_OK {
          while(sqlite3_step(statement) == SQLITE_ROW){
        let name = stringAtField(statement!, fieldIndex: 0)
        let length = sqlite3_column_int(statement!, 1)
           let minutes = sqlite3_column_int(statement!, 2)
           // let type = stringAtField(statement!, fieldIndex: <#T##Int#>)
        let description = stringAtField(statement!, fieldIndex: 4)
            
            let activityRead = activityLog(name: name,length: Int(length),description: description, minutes: Int(minutes))
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
    
    //gets every mood entry
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
            let exerciseMins = sqlite3_column_int(statement!, 10)
            let sleepMins = sqlite3_column_int(statement!, 11)
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
            let objectExerciseMins: Int
            objectExerciseMins = Int(exerciseMins)
            let objectSleepMins: Int
            objectSleepMins = Int(sleepMins)
            
                        
                       
                       
                       var object = Mood(Date: objectDate, Sleep: objectSleep, Water: objectWater, Stress: objectStress, Exercise: objectExercise, Location: objectLocation, Alcohol: objectAlcohol, Mood: objectMood, Productivity: objectProductivity, Notes: objectNotes,SleepMinutes: objectSleepMins, ExerciseMinutes: objectExerciseMins)
            print(object.Date)
            entries.append(object)
            }
        
        sqlite3_finalize(statement)
        }
        
        
        
        
        
        
        return entries
    }
    
    
    
//    func createObject()  {
//        let query = "SELECT * FROM MAIN WHERE DATE = '07-03-2020'"
//            var object: Mood!
//        var statement: OpaquePointer? = nil
//        if sqlite3_prepare_v2(database, query, -1, &statement, nil) == SQLITE_OK {
//        while(sqlite3_step(statement) == SQLITE_ROW){
//            let date = sqlite3_column_int(statement!, 0)
//            let sleep = sqlite3_column_int(statement!, 1)
//             let water = sqlite3_column_int(statement!, 2)
//             let stress = sqlite3_column_int(statement!, 3)
//             let exercise = sqlite3_column_int(statement!, 4)
//            let location = stringAtField(statement!,fieldIndex: 5)
//             let alcohol = sqlite3_column_int(statement!, 6)
//            let mood = sqlite3_column_int(statement!, 8)
//             let productivity = sqlite3_column_int(statement!, 9)
//            let notes = stringAtField(statement!,fieldIndex: 7)
//
//            let objectDate: String
//            objectDate = String(date)
//          //  print(objectDate)
//            let objectSleep: Int
//            objectSleep = Int(sleep)
//            let objectWater: Int
//            objectWater = Int(water)
//            let objectStress: Int
//            objectStress = Int(stress)
//            let objectExercise: Int
//            objectExercise = Int(exercise)
//            let objectLocation : String
//            objectLocation = String(location)
//            let objectAlcohol : Int
//            objectAlcohol = Int(alcohol)
//            let objectMood : Int
//            objectMood = Int(mood)
//            let objectProductivity: Int
//            objectProductivity = Int(productivity)
//            let objectNotes: String
//            objectNotes = String(notes)
//
//
//            var object = Mood(Date: objectDate, Sleep: objectSleep, Water: objectWater, Stress: objectStress, Exercise: objectExercise, Location: objectLocation, Alcohol: objectAlcohol, Mood: objectMood, Productivity: objectProductivity, Notes: objectNotes)
//
//            print(object.Sleep)
//            print(object.Location)
//            print(object.Notes)
////            print(date)
////            print(sleep)
////            print(water)
////            print(stress)
////            print(exercise)
////            print(location)
////            print(alcohol)
////            print(mood)
////            print(productivity)
////            print(notes)
//        }
//        }
//            //return object
//
//    }
    
       
    
    
    
    
    
    
    
    
    
}
