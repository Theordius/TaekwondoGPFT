//
//  JSONLoaderTests.swift
//  TaekwondoGPFTTests
//
//  Created by Rafał Gęsior on 24/04/2023.
//

import XCTest

@testable import TaekwondoGPFT

final class JSONLoaderTests: XCTestCase {
    var sut: JSONLoader!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = JSONLoader()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testJSONLoader() throws {
        var patterns: [Patterns] = []
        patterns = try sut.loadJSON("Patterns.json")
        XCTAssertNotNil(patterns)
        XCTAssertEqual(patterns.count, 24)
    }
    
    func testJSONLoaderFileNotFound() {
        XCTAssertThrowsError(
            try {
                let _: [Patterns] = try sut.loadJSON("NonExistingFile.json")
            }()
        ) { error in
            XCTAssertEqual(
                error as? JSONLoader.TestError,
                JSONLoader.TestError.fileNotFound(
                    "Could not find NonExistingFile.json in main bundle"
                )
            )
        }
    }
    
    
    func testJSONLoaderCorruptedData() {
        do {
            let _:[Patterns] = try sut.loadJSON("CorruptedJSON.json")
        } catch {
            return
        }
        XCTFail("Should throw \(JSONLoader.TestError.fileDataCorrupted())")
    }
}
