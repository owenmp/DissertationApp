//
//  DissTestUnitTests.swift
//  DissTestUnitTests
//
//  Created by Owen Malcolmson-Priest on 10/05/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import XCTest

class DissTestUnitTests: XCTestCase {
    var database = LogsViewController()
    
    func testGettingDate() {
        var mood = database.databaseStore.searchNotes(hours: "today")
        XCTAssert(mood.count == 1)
        (XCTAssert(mood[0].Date == "31-03-2020"))
    }
    
    func testGettingBarAverage() {
        var barAverages = database.databaseStore.getBarAverages(search: "Water", value: "2")
        XCTAssert(barAverages.count == 3)
        
    }
    
    func testGettingPieAverage() {
        var pieAverage = database.databaseStore.getAveragesForMood3(moodLevel: 7)
        XCTAssert(pieAverage.count == 6)
    }
    
    func testGettingAllEntries() {
        var entries = database.databaseStore.getAllEntries()
        XCTAssert(entries.count == 46)
    }
    
    func testGettingLocation() {
        var entry = database.databaseStore.searchEntries(filter: "Location", value: "University")
        var loc = entry[0].Location
        XCTAssert(loc == "University")
    }
    func testGettingSleep() {
        var entry = database.databaseStore.searchSleep(hours: "8", minutes: "30")
        var sleep = entry[0].Sleep
        var sleeMin = entry[0].SleepMinutes
        XCTAssert(sleep == 8 && sleeMin == 30)
        
    }
    
    func testGettingExercise(){
        var entry = database.databaseStore.searchExercise(hours: "2", minutes: "0")
        var exerciseHours = entry[0].Exercise
        var exerciseMin = entry[0].ExerciseMinutes
        XCTAssert(exerciseHours == 2 && exerciseMin == 0)
    }
    
   
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
