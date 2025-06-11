//
//  MAD_ALPTests.swift
//  MAD_ALPTests
//
//  Created by student on 05/06/25.
//

import CoreData
import XCTest
@testable import MAD_ALP
import SwiftData

final class MAD_ALPTests: XCTestCase {
    var ScheduleViewModel: ScheduleViewModel!
    var TemplateViewModel: TemplateViewModel!
    var ExerciseViewModel: ExerciseViewModel!
    
    var context: ModelContext!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let container = try ModelContainer(for: Schedule.self, Exercise.self)
        context = ModelContext(container)
        
        ScheduleViewModel = MAD_ALP.ScheduleViewModel()
        TemplateViewModel = MAD_ALP.TemplateViewModel()
        ExerciseViewModel = MAD_ALP.ExerciseViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Schedule
    func testAddSchedule() throws {
        ScheduleViewModel.addSchedule(
            title: "Test",
            date: Date(),
            time: Date(),
            exercises: [
                ExerciseViewModel.exercises.randomElement()!,
                ExerciseViewModel.exercises.randomElement()!,
                ExerciseViewModel.exercises.randomElement()!,
                ExerciseViewModel.exercises.randomElement()!,
                ExerciseViewModel.exercises.randomElement()!,
            ],
            context: context
        )

        // Assert: fetch from context and verify the schedule was added
        let descriptor = FetchDescriptor<Schedule>(predicate: #Predicate { $0.title == "Test" })
        let schedules = try context.fetch(descriptor)

        XCTAssertTrue(!schedules.isEmpty, "Schedule was not added.")
        if !schedules.isEmpty {
            print("Schedule successfully added.")
        }
    }
    
    func testDeleteSchedule() throws {
        let existingSchedules = try context.fetch(FetchDescriptor<Schedule>())

        // Check if exist
        guard let firstSchedule = existingSchedules.first else {
            XCTFail("No existing schedules found to delete.")
            return
        }

        print("Found existing schedule with ID: \(firstSchedule.id). Proceeding to delete.")

        // Delete
        ScheduleViewModel.deleteSchedule(withID: firstSchedule.id, in: context)

        // Verify
        let updatedSchedules = try context.fetch(FetchDescriptor<Schedule>())
        let stillExists = updatedSchedules.contains { $0.id == firstSchedule.id }

        XCTAssertFalse(stillExists, "Schedule was not deleted.")

        if !stillExists {
            print("Existing schedule deleted successfully.")
        }
    }
    // Schedule
    
    // Template
    func testFetchTemplate() {
        let result = TemplateViewModel.fetchTemplate()
        XCTAssertTrue(result, "templates are empty.")
    }
    // Template

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
