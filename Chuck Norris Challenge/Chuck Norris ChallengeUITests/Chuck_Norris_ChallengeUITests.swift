//
//  Chuck_Norris_ChallengeUITests.swift
//  Chuck Norris ChallengeUITests
//
//  Created by Bruno Luebke on 27/01/21.
//

import XCTest

class Chuck_Norris_ChallengeUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testInitialState() {
        let app = XCUIApplication()
        app.launch()
        
        let stateLabel = app.staticTexts["stateMessage"]
        let stateImage = app.images["stateImage"]
        
        XCTAssert(stateLabel.exists)
        XCTAssert(stateImage.exists)

        XCTAssertEqual(stateLabel.label, "Let's find some facts")
        XCTAssertEqual(stateImage.label, "chuckNorrisApproved")
        
    }
    
    func testSearchBar() {
        let app = XCUIApplication()
        app.launch()
        
        let searchBar = app.otherElements["searchBar"].searchFields.firstMatch
        
        XCTAssert(searchBar.exists)
        
        searchBar.tap()
        searchBar.typeText("test")
        app.buttons["search"].tap()
    }

    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
