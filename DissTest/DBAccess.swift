//
//  DBAccess.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 02/03/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import Foundation
import SQLite3


private let _hiddenSharedInstance = DBAccess()

class DBAccess{
    
    class var sharedInstance: DBAccess{
        return _hiddenSharedInstance;
    }
    
    var mySQLDB: OpaquePointer? = nil
    
       //Runs when app starts, loads bookmark strings
       init(){
           openSQLDB()
            insert()
       }
      
    //Opens connection to the conf.sql database
      func openSQLDB(){
          //Set up path to DB, and open
          let bundle = Bundle.main
          guard let defaultDBPath = bundle.path( forResource: "table", ofType: "db")
              else {
                  assertionFailure( "Couldn't find database path")
                  return
          }
          guard sqlite3_open_v2( defaultDBPath, &mySQLDB, SQLITE_OPEN_READONLY, nil) == SQLITE_OK
              else {
                  assertionFailure( "Couldn't open database")
                  return
          }
      }
    
    //Used to return string fields from the database
      func stringAtField(_ statementPointer: OpaquePointer, fieldIndex: Int ) -> String {
          var answer = "Error - DBAccess failed"
          if let rawString = sqlite3_column_text(statementPointer, Int32(fieldIndex) ) {
              answer = String(cString: rawString)
          }
          return answer
      }
    
    
    let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
    let insertStatementString = "INSERT INTO main (DATE) VALUES (?);"
    func insert(){
        var insertStatement: OpaquePointer?
        //1
        if sqlite3_prepare_v2(mySQLDB,insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
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
    
    
   
    
    

    
    
    func readRows()->[String]{
        var entries: [String] = []
        let query = "SELECT DATE FROM MAIN;"
        var statement: OpaquePointer? = nil
        if sqlite3_prepare_v2( mySQLDB, query, -1, &statement, nil) == SQLITE_OK {
        while(sqlite3_step(statement) == SQLITE_ROW){
        let first = stringAtField(statement!, fieldIndex: 0)
        let second = stringAtField(statement!, fieldIndex: 1)
            entries.append(first)
            entries.append(second)
            }
        }
            print(entries[1])
            print(entries[2])
            return entries
        }
    
    
    
    
    func readIntoObjects(){
        
    }
        
    
    
    
    


}
