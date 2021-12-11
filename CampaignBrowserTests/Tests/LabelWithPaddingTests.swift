//
//  LabelWithPaddingTests.swift
//  CampaignBrowserTests
//
//  Created by SAIF ULLAH on 10/12/2021.
//  Copyright © 2021 Westwing GmbH. All rights reserved.
//

import XCTest
@testable import CampaignBrowser

class LabelWithPaddingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    /**Test to check if label padding is applying on label*/
    func testLabelHasPadding(){
        let label = MockPadingLabel()
        label.draw(.zero)
        XCTAssertTrue(label.paadingIsBeingSet)
        
    }
    /**Test to check label has expected padding*/
    func testLabelHasExpectedPadding(){
        let label = MockPadingLabel()
        label.drawText(in: .zero)
        XCTAssertTrue(label.paddingLeft == 8 && label.paddingRight == 8)
        XCTAssertTrue(label.paddingTop == 0 && label.paddingBottom == 0)
        
    }

}
extension LabelWithPaddingTests {
    class MockPadingLabel: LabelWithPadding{
        var paadingIsBeingSet : Bool = false
        override func drawText(in rect: CGRect) {
            super.drawText(in: rect)
            paadingIsBeingSet = true
        }
        
    }
}
