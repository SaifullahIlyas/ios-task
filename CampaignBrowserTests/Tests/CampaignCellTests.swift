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

class CampaignCellTests: XCTestCase {

    var collectionView: CampaignListingView!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    /**Test to check campain label should be of type SelfSizedCell*/
    func testCampaignCellIsTypeOfSelfSizedCell(){
        collectionView = MockCollectionView.mockInit()
       let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "campaignCell", for: IndexPath(row: 0, section: 0))
      
        XCTAssert(cell is SelfSizedCell)
        
        
        
    }
    /**Test to check title label is max two line long*/
    func testTitlehasMaxHeightOfTwoLines() {
        guard let sut = makeSut() else {
            return
        }
        sut.loadView()
        collectionView = sut.typedView
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"campaignCell" , for: IndexPath(row: 0, section: 0)) as? CampaignCell else {
            return
        }
        cell.name = "line1"
        let nameLblHeigthWithLine1 = cell.nameLabel.intrinsicContentSize.height
        cell.name  = "line 1 \n line 2"
        let nameLblHeigthWithLine2 = cell.nameLabel.intrinsicContentSize.height
        XCTAssertTrue(nameLblHeigthWithLine1 < nameLblHeigthWithLine2)
        cell.name = "line 1 \n line 2 \n line3"
        let nameLblHeigthWithLine3 = cell.nameLabel.intrinsicContentSize.height
        XCTAssertTrue(nameLblHeigthWithLine2 == nameLblHeigthWithLine3)
        cell.name = "line1\nline2\nline3\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline\nnewline"
        let edgeCaseNameLblHeight  =  cell.nameLabel.intrinsicContentSize.height
XCTAssertTrue(nameLblHeigthWithLine2 == edgeCaseNameLblHeight)
//        XCTAssert((cell.nameLabel.calculateMaxLines(te) == 2) )
        
    
    }
    /**Test to check if label height grow with text size*/
    func testDescriptionLabelHeightIsTextDespendent(){
        guard let sut = makeSut() else {
            return
        }
        sut.loadView()
        collectionView = sut.typedView
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"campaignCell" , for: IndexPath(row: 0, section: 0)) as? CampaignCell else {
            return}
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
        guard let sut = makeSut() else {
            return
        }
        sut.loadView()
        collectionView = sut.typedView
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"campaignCell" , for: IndexPath(row: 0, section: 0)) as? CampaignCell else {
            return}
        cell.moodImage = getImage()
        XCTAssertTrue(floor(cell.imageView.bounds.width) == floor(cell.imageView.bounds.height * (4/3)))
        
        
    }
    private func getImage()->Observable<UIImage>{
        return Observable<UIImage>.just(UIImage(named: "image")!)
    }
    /**Generate String based on inputed number*/
    private func buildStringWithNumberOf(lines num : Int)->String{
        var string = ""
        for val in 0...num {
         string += "Line\(val)\n"
        }
        return string
    }
    private func makeSut()->CampaignListingViewController? {
      return  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "campaignListingViewControllerIDF") as? CampaignListingViewController
    }
    
   
}

extension CampaignCellTests {
    class MockCollectionView : CampaignListingView {
        
        class func mockInit()-> MockCollectionView {
            let collectionView = MockCollectionView.init(frame: CGRect(x: 0, y: 0, width: 400, height: 500), collectionViewLayout: UICollectionViewFlowLayout())
            collectionView.register(CampaignCell.self, forCellWithReuseIdentifier: "campaignCell")
            return collectionView
        }
        override func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
            let cell = CampaignCell(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
            
            return cell
        }
    }
}
