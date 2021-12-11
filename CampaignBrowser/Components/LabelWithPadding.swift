import UIKit


/**
 A custom label that has some padding between its frame and its displayed text. Configurable in Interface Builder.
 */
@IBDesignable
class LabelWithPadding: UILabel,Spaceable {
    var paddingTop: CGFloat = 0
    
    var paddingBottom: CGFloat = 0
    
    var paddingLeft: CGFloat = 8
    
    var paddingRight: CGFloat = 8
    

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: UIEdgeInsets(top: paddingTop, left: paddingLeft, bottom: paddingRight, right: paddingRight)))
    }

//    override var intrinsicContentSize: CGSize {
//        let originalSize = super.intrinsicContentSize
//        return CGSize(width: originalSize.width + padding * 2, height: originalSize.height + padding * 2)
//    }
}
