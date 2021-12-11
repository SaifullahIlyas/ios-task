//
//  CampaignListingViewTests.swift
//  CampaignBrowserTests
//
//  Created by SAIF ULLAH on 10/12/2021.
//  Copyright © 2021 Westwing GmbH. All rights reserved.
//

import XCTest
import RxSwift
@testable import CampaignBrowser
var collectionView : CampaignListingView!
class CampaignListingViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCampaignListingViewCellsAreSelfSized(){
        guard let sut = makeSut() else {
            return
        }
        sut.loadView()
        collectionView = sut.typedView
        let campaigns  = [CampaignListingView.Campaign(name: "hy i am title with one line hopefully", description: "Hy i am description.more detail is bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla", moodImage:getImage() )]
        collectionView.display(campaigns: campaigns)
        collectionView.layoutIfNeeded()
       
        guard let cell = collectionView.dataSource?.collectionView(collectionView, cellForItemAt: IndexPath(row: 0, section: 0)) as? CampaignCell else {
            return
        }
       // collectionView.layoutSubviews()
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        let contentViewHeight = cell.frame.height
        let cellSubviewsHeight = cell.imageView.intrinsicContentSize.height + cell.nameLabel.intrinsicContentSize.height + cell.intrinsicContentSize.height
        
        XCTAssertTrue(contentViewHeight >= cellSubviewsHeight)
    
           
        
        
        
        
        
    }
    private func getImage()->Observable<UIImage>{
        return Observable<UIImage>.just(UIImage(named: "image")!)
    }
    private func makeSut()->CampaignListingViewController? {
      return  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "campaignListingViewControllerIDF") as? CampaignListingViewController
    }

}

