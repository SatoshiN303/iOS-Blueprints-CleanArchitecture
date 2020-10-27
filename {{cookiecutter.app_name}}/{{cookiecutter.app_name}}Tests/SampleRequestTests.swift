//
//  SampleRequestTests.swift
//  {{cookiecutter.app_name}}Tests
//
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import XCTest
import APIKit
import OHHTTPStubs
@testable import __cookiecutter_app_name__

class SampleRequestTests: XCTestCase {
    
    lazy var searchReposExpectation: XCTestExpectation = self.expectation(description: "wait for test")

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testStubSearchRepositoriesRequest() {
        setUpStub()
        let expectation = self.expectation(description: "wait for stub")
        let params = SearchRepositoriesParameters(query: "swift", page: "1", perPage: nil, sort: .stars, order: .desc)
        let request = SearchRepositryRequest(parameter: params)
        Session.send(request, callbackQueue: nil) { result in
            switch result {
            case let .success(value):
                XCTAssert(!value.items.isEmpty)
                expectation.fulfill()
            case let .failure(error):
                XCTFail("session error!! \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testCheckingSampleUseCase() {
        let gateway = SampleGateway()
        let presenter = self
        let usecase = SampleUseCase()
        usecase.gateway = gateway
        usecase.presenter = presenter
        usecase.fetch("Swift", page: 1)
        wait(for: [searchReposExpectation], timeout: 5.0)
    }
    
    private func setUpStub() {
        stub(condition: isPath("/search/repositories")) { _ in
            guard let stubPath = OHPathForFile("search_repositories_success.json", type(of: self)) else {
                fatalError("json fileName is incorrect")
            }
            return fixture(filePath: stubPath, headers: ["Content-Type": "application/json"])
        }
    }
}

extension SampleRequestTests: SamplePresenterInputProtocol, SampleUseCaseOutputProtocol {
    var rowCount: Int {
        return 0
    }
    
    func searchRepository(_ keyword: String, page: Int?) {
    }
    
    func sampleCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func didSelect(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> Repository? {
        return nil
    }
    
    func pagination(_ scrollView: UIScrollView) {
    }
    
    func fetchSucceeded(_ repositories: [Repository]) {
        XCTAssert(!repositories.isEmpty)
        searchReposExpectation.fulfill()
    }
    
    func fetchFailed(_ error: SessionError) {
        XCTFail("session error!! \(error)")
        searchReposExpectation.fulfill()
    }
}
