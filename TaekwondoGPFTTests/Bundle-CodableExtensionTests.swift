//
//  Bundle-CodableExtensionTests.swift
//  TaekwondoGPFTTests
//
//  Created by Rafał Gęsior on 22/04/2023.
//

import XCTest
@testable import TaekwondoGPFT

final class Bundle_CodableExtensionTests: XCTestCase {
    var sut: Bundle!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Bundle.main
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testBundleLoadsFile() {
        var patterns: [Patterns] = []
        patterns = sut.decode("Patterns.json")
        XCTAssertNotNil(patterns)
        XCTAssertEqual(patterns.count, 24)
    }
    
    func testBundleLoadsNonExistingFile() {
       // TODO
    }
    
    func testBundleLoadsCorruptedFile() {
       //TODO - Will have to change the way JSON is being loaded
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
