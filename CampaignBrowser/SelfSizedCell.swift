//
//  SelfSizedCell.swift
//  CampaignBrowser
//
//  Created by SAIF ULLAH on 09/12/2021.
//  Copyright © 2021 Westwing GmbH. All rights reserved.
//

import UIKit

class SelfSizedCell : UICollectionViewCell {
    lazy var bgView = UIView()
     lazy var width : NSLayoutConstraint = {
         NSLayoutConstraint.init(item: bgView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: UIScreen.main.bounds.width )
     }()
    private lazy var widthConstraint = contentView.widthAnchor.constraint(equalToConstant: 0)
    var isActive = false
     override func awakeFromNib()  {
         super.awakeFromNib()
         
        // bgView.backgroundColor = .black
         bgView.translatesAutoresizingMaskIntoConstraints = false
         contentView.insertSubview(bgView, at: 0)
        bgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
         bgView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
         bgView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
         bgView.bottomAnchor.constraint(equalTo:bottomAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
       // contentView.updateConstraintsIfNeeded()
         
     }
    override func updateConstraints() {
        widthConstraint.constant = superview?.bounds.width ?? 0
        widthConstraint.isActive = true
        super.updateConstraints()
    }
}
