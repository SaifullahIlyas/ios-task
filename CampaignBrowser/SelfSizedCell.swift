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
    private lazy var widthConstraint = contentView.widthAnchor.constraint(equalToConstant: 0)
    var isActive = false
    override func awakeFromNib()  {
        super.awakeFromNib()
        bgView.translatesAutoresizingMaskIntoConstraints = false
        contentView.insertSubview(bgView, at: 0)
        NSLayoutConstraint.activate([ bgView.topAnchor.constraint(equalTo: topAnchor),bgView.leftAnchor.constraint(equalTo: leftAnchor),bgView.rightAnchor.constraint(equalTo: rightAnchor),bgView.bottomAnchor.constraint(equalTo:bottomAnchor),contentView.centerXAnchor.constraint(equalTo: centerXAnchor),contentView.centerYAnchor.constraint(equalTo: centerYAnchor)])
        
        
        
        
        
    }
    override func updateConstraints() {
        widthConstraint.constant = superview?.bounds.width ?? 0
        widthConstraint.isActive = true
        super.updateConstraints()
    }
}
