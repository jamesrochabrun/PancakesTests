//
//  PancakeHousseCollectionIntegrationTests.swift
//  StackReview
//
//  Created by James Rochabrun on 6/9/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import XCTest
@testable import StackReview

//MARK integration tests holds asynchronous calls or networking code
//MARK: testing asynchronous calls using mocks
//tests can end before the completion hanlder is called
//thats why we use expectations
//we provide a time interval
//we might not rely the test in networking
//thats why we use mock objects , stub
//becuase the lack of dynamic type support in swift is a bit more complicated to write mocks than objective c
//we can create mocks by:
//subclassing and overriding an existing object
//or conforming to a protocol


//INTEGRATION TESTS, involves interaction between systems and components such as networking

class PancakeHousseCollectionIntegrationTests: XCTestCase {
    
    var collection: PancakeHouseCollection!
    
    override func setUp() {
        super.setUp()
        collection = PancakeHouseCollection()
    }
    
    func testLoadPancakesFromCloudFails() {
        
        //given
        let expectation = self.expectation(description: "Expect load pancakes from cloud to fail")
        
        //when
        collection.loadPancakesFromCloud { (data) in
            //tells the expectation to run
            expectation.fulfill()
            XCTAssertFalse(data)
        }
        //then
        waitForExpectations(timeout: 3, handler: nil)
    }
}




