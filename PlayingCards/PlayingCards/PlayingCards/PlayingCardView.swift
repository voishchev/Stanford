//
//  PlayingCardView.swift
//  PlayingCards
//
//  Created by Sergei Voishchev on 13.06.2022.
//

import UIKit

class PlayingCardView: UIView {
    var rank: Int = 5 {didSet {setNeedsDisplay(); setNeedsLayout()}}
    var suite: String = "♥️" {didSet {setNeedsDisplay(); setNeedsLayout()}}
    var isFaceUp: Bool = true {didSet {setNeedsDisplay(); setNeedsLayout()} }
    
    private func centeredAttributedString(_ string: String, fontSize: CGFloat) -> NSAttributedString {
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
//            !!!!!
//            for scaling according to user's preferences
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = . center
        return NSAttributedString(string: string, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle, .font: font])
    }
    
    private var cornerString: NSAttributedString {
        return centeredAttributedString(rankString+"\n"+suite, fontSize: cornerFontSize )
    }
    
    private lazy var upperLeftCornerLabel = createCornerLabel()
    private lazy var lowerRightCornerLabel = createCornerLabel()
    
    private func createCornerLabel() -> UILabel {
        let label = UILabel()
//        0 = use as many lines as you need
        label.numberOfLines = 0
        addSubview(label)
        return label
    }
    
    private func configureCornerLabel(_ label: UILabel) {
        label.attributedText = cornerString
        label.frame.size = CGSize.zero
        label.sizeToFit()
        label.isHidden =   !isFaceUp
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureCornerLabel(upperLeftCornerLabel)
        upperLeftCornerLabel.frame.origin = bounds.origin.offsetBy(dx:  cornerOffset, dy: cornerOffset )
        
        configureCornerLabel(lowerRightCornerLabel)
        lowerRightCornerLabel.transform  = CGAffineTransform.identity.rotated(by: CGFloat.pi)
        lowerRightCornerLabel.frame.origin = CGPoint(x: bounds.maxX, y: bounds.maxY).offsetBy(dx: -cornerOffset, dy: -cornerOffset).offsetBy(dx: -lowerRightCornerLabel.frame.size.width, dy: -lowerRightCornerLabel.frame.size.height)
          
    }
    
    
//    for redrawing when system size has changed
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsLayout()
        setNeedsDisplay()
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
          let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius )
          roundedRect.addClip()
          UIColor.white.setFill()
          roundedRect.fill()
//        little sample how to draw
//        bad way
        //1st step:
//        if let context = UIGraphicsGetCurrentContext() {
//            //2nd step:
//            context.addArc(center:  CGPoint(x: bounds.midX, y: bounds.midY), radius: 100, startAngle: 0, endAngle: 2*CGFloat.pi , clockwise: false)
//            //3rd step:
//            context.setLineWidth(4.0)
//            context.setAlpha(0.7)
//            UIColor.brown.setFill()
//            UIColor.gray.setStroke()
//            // 4th step:
//            context.strokePath()
//            context.fillPath()
//        }
        
//        good way with UIBezierPath
//        let path = UIBezierPath()
//        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: 100, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: false)
//        path.lineWidth = 34.0
//        UIColor.brown.setFill()
//        UIColor.gray.setStroke()
//        path.stroke()
//        path.fill()
    }
}

extension PlayingCardView {
    private struct SizeRatio {
        static let cornerFontSizeToBoundsHeight: CGFloat = 0.085
        static let cornerRadiusToBoundsHeight: CGFloat = 0.06
        static let cornerOffsetToCornerRadius: CGFloat = 0.33
        static let faceCardImageSizeToBoundsSize: CGFloat = 0.75
    }
    private var cornerRadius: CGFloat {
        return bounds.size.height*SizeRatio.cornerRadiusToBoundsHeight
    }
    private var cornerOffset: CGFloat {
        return cornerRadius*SizeRatio.cornerOffsetToCornerRadius
    }
    private var cornerFontSize: CGFloat {
        return bounds.size.height*SizeRatio.cornerFontSizeToBoundsHeight
    }
    private var rankString: String {
        switch rank {
        case 1: return "A"
        case 2...10: return String(rank)
        case 11: return "J"
        case 12: return "Q"
        case 13: return "K"
        default: return "?"
        }
    }
}

extension CGRect {
    var leftHalf: CGRect {
        return CGRect(x: minX, y: minY, width: width/2, height: height)
    }
    var rightHalf: CGRect {
        return CGRect(x: minX, y: minY, width: width/2, height: height)
    }
    func insert(by size: CGSize) -> CGRect {
        return insetBy(dx: size.width, dy: size.height)
    }
    func sized(to size: CGSize) -> CGRect {
        return CGRect(origin: origin, size: size)
    }
    func zoom(by scale: CGFloat) -> CGRect {
        let newWidth = width*scale
        let newHeight = height*scale
        return insetBy(dx: (width-newWidth)/2, dy: (height-newHeight)/2)
    }
}
extension CGPoint {
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: x+dx, y: y+dy)
    }
}
