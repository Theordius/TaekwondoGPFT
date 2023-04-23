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
    
    enum TestError: Error, Equatable {
        case fileNotFound(_ message: String = "")
        case fileDataCorrupted(_ message: String = "")
    }
    
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
        do {
            let _: [Patterns] = sut.decode("NonExistingFile.json")
        } catch {
            return
        }
        XCTFail("Should throw \(TestError.fileNotFound())")
    }
    
    func testBundleLoadsCorruptedFile() {
       //TODO - Will have to change the way JSON is being loaded
        do {
            let _: [Patterns] = sut.decode("CorruptedJSON.json")
        } catch {
            return
        }
        XCTFail("Should throw \(TestError.fileDataCorrupted())")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
