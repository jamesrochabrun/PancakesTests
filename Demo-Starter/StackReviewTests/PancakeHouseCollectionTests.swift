//
//  PancakeHouseCollectionTests.swift
//  StackReview
//
//  Created by James Rochabrun on 6/9/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import XCTest

//MARK: important notes
//import the @testable target
//fail the target
//pass the target
//refactor it

@testable import StackReview

class PancakeHouseCollectionTests: XCTestCase {
    
    //func setup() runs every time a test is called, means runs each time before each call, each test will get a new instnace of the collection
    override func setUp() {
        super.setUp()
        collection = PancakeHouseCollection()
        let bundle = Bundle(for: PancakeHouseCollectionTests.self)
        collection.loadPancakeHouses("test_pancake_houses", in: bundle)
        
    }
    
    //each method need a new instance
    var collection: PancakeHouseCollection!
    
    func testCollectionHasExpectedItemsCount() {
        
        XCTAssert(collection.count == 3, "Colection is not equal to 3")
    }
    
    func testFirstPancakeHouseHasEXpectedValues() {
        
        verifypancakeHouseHasExpectedValues(index: 0)
    }
    
    func testSecondPancakeHouseHasEXpectedValues() {
        
        verifypancakeHouseHasExpectedValues(index: 1)
    }
    
    func testThirdPancakeHouseHasEXpectedValues() {
        
        verifypancakeHouseHasExpectedValues(index: 2)
    }
    
    //helper method for assertion of plist detail implementation
    func verifypancakeHouseHasExpectedValues(index: Int) {
        
        let pancakeHouse = collection[index]
        let plistIndex = index + 1
        XCTAssertEqual(pancakeHouse.name, "name \(plistIndex)")
        XCTAssertEqual(pancakeHouse.details, "details \(plistIndex)")
        
        //accepts any two things that are equatable if one of them is not nil or not nil it will fail
        XCTAssertEqual(pancakeHouse.photo, UIImage(named: "pancake\(plistIndex)"))
    }
    
    func testIfPancakeHouseCanBeAdded() {
        
        let dict: [String: Any] = ["name" : "Test Pancake House",
                                   "priceGuide" : 1,
                                   "rating": 1,
                                   "details" : "Test"]
        let pancakeHouse = PancakeHouse(dictionary: dict)!
        //when
        collection.addPancakeHouse(pancakeHouse)
        //then
        XCTAssertTrue(collection._pancakeHouses.contains(pancakeHouse))
    }
    
    func testIfPancakeCanBeRemoved() {
        
        //given
        let pancakeHouse = collection[0]
        //when
        try! collection.removePancakeHouse(pancakeHouse)
        //then
        XCTAssertFalse(collection._pancakeHouses.contains(pancakeHouse))
    }
    
    //PERFORMANCE TESTS
    func testMeasuerLoadDefaultPancakeHouses() {
        
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
}



