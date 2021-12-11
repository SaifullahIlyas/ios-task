//
//  Spaceable.swift
//  CampaignBrowser
//
//  Created by SAIF ULLAH on 10/12/2021.
//  Copyright © 2021 Westwing GmbH. All rights reserved.
//

import UIKit
protocol Spaceable : AnyObject {
    var paddingTop : CGFloat{get}
    var paddingBottom : CGFloat{get}
    var paddingLeft : CGFloat{get}
    var paddingRight : CGFloat{get}
    
}
