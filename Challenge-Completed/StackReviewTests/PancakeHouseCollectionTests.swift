//
//  PancakeHouseCollectionTests.swift
//  StackReview
//
//  Created by Joshua Greene on 11/4/16.
//  Copyright © 2016 Razeware. All rights reserved.
//

import XCTest
@testable import StackReview

class PancakeHouseCollectionTests: XCTestCase {
  
  var collection: PancakeHouseCollection!
  
  override func setUp() {
    super.setUp()
    
    collection = PancakeHouseCollection()
    
    let bundle = Bundle(for: PancakeHouseCollectionTests.self)
    collection.loadPancakeHouses("test_pancake_houses", in: bundle)
  }
  
  func testCollectionHasExpectedItemsCount() {
    
    XCTAssert(collection.count == 3,
              "Collection didn't have expected number of items")
  }
  
  func testFirstPancakeHouseHasExpectedValues() {
    verifyPancakeHouseHasExpectedValues(index: 0)
  }
  
  func testSecondPancakeHouseHasExpectedValues() {
    verifyPancakeHouseHasExpectedValues(index: 1)
  }
  
  func testThirdPancakeHouseHasExpectedValues() {
    verifyPancakeHouseHasExpectedValues(index: 2)
  }
  
  func verifyPancakeHouseHasExpectedValues(index: Int) {
    
    let pancakeHouse = collection[index]
    let plistIndex = index + 1
    
    XCTAssertEqual(pancakeHouse.name, "name \(plistIndex)")
    XCTAssertEqual(pancakeHouse.details, "details \(plistIndex)")
    XCTAssertEqual(pancakeHouse.photo, UIImage(named: "pancake\(plistIndex)"))
  }
  
  // MARK: - Adding/Removing Pancake Houses
  
  func testCanAddPancakeHouse() {
    
    // given
    let dict: [String: Any] = ["name": "Test Pancake House",
                               "priceGuide": 1,
                               "rating": 1,
                               "details": "Test"]
    
    let pancakeHouse = PancakeHouse(dictionary: dict)!
    
    // when
    collection.addPancakeHouse(pancakeHouse)
    
    // then
    XCTAssertTrue(collection._pancakeHouses.contains(pancakeHouse))
  }
  
  func testCanRemovePancakeHouse() {
    
    // given
    let pancakeHouse = collection[0]
    
    // when
    try! collection.removePancakeHouse(pancakeHouse)
    
    // then
    XCTAssertFalse(collection._pancakeHouses.contains(pancakeHouse))
  }
}
