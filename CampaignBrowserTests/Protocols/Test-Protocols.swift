//
//  Test-Protocols.swift
//  CampaignBrowserTests
//
//  Created by SAIF ULLAH on 11/12/2021.
//  Copyright © 2021 Westwing GmbH. All rights reserved.
//

import XCTest
import RxSwift
@testable import CampaignBrowser
/**Instantiate view under test*/
protocol NeedsSut  {
    
}
extension NeedsSut where Self : XCTestCase {
     func makeSut()->CampaignListingViewController? {
      return  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "campaignListingViewControllerIDF") as? CampaignListingViewController
    }
    
}

/**Get Observable image from assets*/
protocol NeedsObservableImage {
    
}
extension NeedsObservableImage{
    func getImage()->Observable<UIImage>{
        return Observable<UIImage>.just(UIImage(named: "image")!)
    }
}
protocol NeedsMultilinesString {
    
}
extension NeedsMultilinesString{
    /**Generate String based on inputed number*/
     func buildStringWithNumberOf(lines num : Int)->String{
        var string = ""
        for val in 0...num {
         string += "Line\(val)\n"
        }
        return string
    }
}
protocol CellIdentifier  {
    var campaignCell : String {get}
}
extension CellIdentifier {
    var campaignCell : String {
        return "campaignCell"
        
    }
}
