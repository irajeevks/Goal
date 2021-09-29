//
//  GoalTests.swift
//  GoalTests
//
//  Created by RAjeev Singh on 27/09/21.
//

import XCTest
@testable import Goal

class GoalTests: XCTestCase {
    var obj : Items?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testContentForNoRecord() {
        let title : String?
        title = nil
        let str = obj?.checkIfEmpty(title: title, subtitle: "test")
        XCTAssertNil(obj, str!)
    }
    
    func testInit_ShouldTakeTitle() {
        let item = Items(title: "Test title")
        XCTAssertEqual(item.title, "Test title", "Initializer should set the item title")
    }
    
    func testInit_ShouldTakeSubTitle() {
        let item = Items(title: "Test subtitle")
        XCTAssertEqual(item.title, "Test subtitle", "Initializer should set the item subtitle")
    }

}
