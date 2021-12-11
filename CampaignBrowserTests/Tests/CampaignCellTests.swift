//
//  CampaignCellTests.swift
//  CampaignBrowserTests
//
//  Created by SAIF ULLAH on 08/12/2021.
//  Copyright © 2021 Westwing GmbH. All rights reserved.
//

import XCTest
import RxSwift

@testable import CampaignBrowser

class CampaignCellTests: XCTestCase,NeedsSut,NeedsObservableImage,NeedsMultilinesString,CellIdentifier {

    var collectionView: CampaignListingView!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    /**Test to check campain label should be of type SelfSizedCell*/
    func testCampaignCellIsTypeOfSelfSizedCell(){
        collectionView = MockCollectionView.mockInit(forCell: campaignCell)
       let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: campaignCell, for: IndexPath(row: 0, section: 0))
      
        XCTAssert(cell is SelfSizedCell)
        
        
        
    }
    /**Test to check title label is max two line long*/
    func testTitlehasMaxHeightOfTwoLines() {
       let cell = getCampaignCell()
        cell.name = "line1"
        let nameLblHeigthWithLine1 = cell.nameLabel.intrinsicContentSize.height
        cell.name  = "line 1 \n line 2"
        let nameLblHeigthWithLine2 = cell.nameLabel.intrinsicContentSize.height
        XCTAssertTrue(nameLblHeigthWithLine1 < nameLblHeigthWithLine2)
        cell.name = "line 1 \n line 2 \n line3"
        let nameLblHeigthWithLine3 = cell.nameLabel.intrinsicContentSize.height
        XCTAssertTrue(nameLblHeigthWithLine2 == nameLblHeigthWithLine3)
        cell.name = buildStringWithNumberOf(lines: 50)
        let edgeCaseNameLblHeight  =  cell.nameLabel.intrinsicContentSize.height
XCTAssertTrue(nameLblHeigthWithLine2 == edgeCaseNameLblHeight)
//        XCTAssert((cell.nameLabel.calculateMaxLines(te) == 2) )
        
    
    }
    /**Test to check if label height grow with text size*/
    func testDescriptionLabelHeightIsTextDespendent(){
        let cell = getCampaignCell()
        cell.descriptionText = "Line1"
        let descriptionLblHeightWithLine1 = cell.descriptionLabel.intrinsicContentSize.height
        cell.descriptionText = "Line1\nLine2"
        let descriptionLblHeightWithLine2 = cell.descriptionLabel.intrinsicContentSize.height
        cell.descriptionText = "Line1\nLine2\nLine3"
        let descriptionLblHeightWithLine3 = cell.descriptionLabel.intrinsicContentSize.height
        XCTAssertTrue(descriptionLblHeightWithLine3>descriptionLblHeightWithLine2)
        cell.descriptionText = buildStringWithNumberOf(lines: 8)
        XCTAssertTrue(cell.descriptionLabel.intrinsicContentSize.height >= descriptionLblHeightWithLine1*8 )
        
    }
    func testToCheckIfImageViewHasExpectedRatio(){
        let cell = getCampaignCell()
        cell.moodImage = getImage()
        XCTAssertTrue(floor(cell.imageView.bounds.width) == floor(cell.imageView.bounds.height * (4/3)))
        
        
    }
    
    private func getCampaignCell()->CampaignCell {
        guard let sut = makeSut() else {
            fatalError()
        }
        sut.loadView()
        collectionView = sut.typedView
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:campaignCell , for: IndexPath(row: 0, section: 0)) as? CampaignCell else {
            return CampaignCell()}
        return cell
    }
    
    
   
}

extension CampaignCellTests {
    class MockCollectionView : CampaignListingView {
        
        class func mockInit(forCell cell : String)-> MockCollectionView {
            let collectionView = MockCollectionView.init(frame: CGRect(x: 0, y: 0, width: 400, height: 500), collectionViewLayout: UICollectionViewFlowLayout())
            collectionView.register(CampaignCell.self, forCellWithReuseIdentifier: cell)
            return collectionView
        }
        override func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
            let cell = CampaignCell(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
            
            return cell
        }
    }
}
