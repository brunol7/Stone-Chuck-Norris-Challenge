//
//  Chuck_Norris_ChallengeTests.swift
//  Chuck Norris ChallengeTests
//
//  Created by Bruno Luebke on 27/01/21.
//

import XCTest
@testable import Chuck_Norris_Challenge

class Chuck_Norris_ChallengeTests: XCTestCase {

    var setupContentView : ContentView?
    
    var setupViewModel : FactsListViewModel?
    
    override func setUpWithError() throws {
        setupViewModel = FactsListViewModel()
        setupContentView = ContentView(viewModel: setupViewModel ?? FactsListViewModel())
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewModel() {
        let viewModel = FactsListViewModel()
        XCTAssertEqual(viewModel.searchState, .zero)
        XCTAssertEqual(viewModel.facts.count, 0)
        XCTAssertEqual(viewModel.searchText, "")
        viewModel.searchFacts(query: "")
        XCTAssertEqual(viewModel.facts.count, 0)
        viewModel.searchFacts(query: "termThatWillReturnNoResults")
        XCTAssertEqual(viewModel.facts.count, 0)
        viewModel.searchFacts(query: "test")
        if viewModel.searchState == .successfull {
            XCTAssertGreaterThan(viewModel.facts.count, 0)
        } else {
            XCTAssertEqual(viewModel.facts.count, 0)
        }
    }
    
    func testContentView() {
        let contentView = ContentView(viewModel: FactsListViewModel())
        contentView.viewModel.searchText = "test"
        if contentView.viewModel.searchState == .successfull {
            XCTAssertGreaterThan(contentView.viewModel.facts.count, 0)
        } else {
            XCTAssertEqual(contentView.viewModel.facts.count, 0)
        }
    }
    
    func testContentViewPerformance() {
        measure {
            _ = ContentView(viewModel: FactsListViewModel())
            setupContentView?.viewModel.searchText = "test"
        }
    }
    
    
    func testViewModelLoadPerformance() {
        measure{
            _ = FactsListViewModel()
            setupViewModel?.searchFacts(query: "test")
        }
    }

}
