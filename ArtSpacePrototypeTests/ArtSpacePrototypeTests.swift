//
//  ArtSpacePrototypeTests.swift
//  ArtSpacePrototypeTests
//
//  Created by God on 1/21/20.
//  Copyright © 2020 God. All rights reserved.
//

import XCTest
@testable import ArtSpacePrototype

class ArtSpacePrototypeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFromDict() {
        let testDict: [String:Any] = ["artDescription": "HI!", "artImageURL": "URL HERE", "artID": "This is the artID", "sellerID": "sellerID here", "price": 100.0, "soldStatus": false ]
        
        let testObject = ArtObject(from: testDict, id: "This is the id")
        
        XCTAssert(testObject != nil)
        
/**
         let artDescription: String
         let artImageURL: String
         let artID: String
         let sellerID: String
         let price: Double
         let soldStatus: Bool = false
         let dateCreated: Date?*/
    }
    

}

/**
 func testEventFromJSON() {
     
     let testBundle = Bundle(for: type(of: self))
     guard let pathToData = testBundle.path(forResource: "ticketmasterJSON", ofType: "json") else { XCTFail("Couldn't find json file")
         return}

     let url = URL(fileURLWithPath: pathToData)
     do {
         let data = try Data(contentsOf: url)
         let events = try Event.getEvents(from: data)

         XCTAssert(events != nil, "We couldn't get those events")
     } catch {
         XCTFail(error.localizedDescription)
         print(error)
     }
     
 }
 */
