//
//  ArcView.swift
//  IBDesignable-IBInspectable
//
//  Created by Sebastian Boldt on 14.08.16.
//  Copyright © 2016 Sebastian Boldt. All rights reserved.
//

import UIKit
import GLKit

@IBDesignable public class ArcView: UIView {
    
    private var mainOvalLayer: CAShapeLayer?
    private var subOvalLayer: CAShapeLayer?
    
    @IBInspectable public var fgColor : UIColor = UIColor.blackColor() {
        didSet {
            self.updateUI()
        }
    }
    
    @IBInspectable public var bgColor = UIColor.lightGrayColor() {
        didSet {
            self.updateUI()
        }
    }
    
    @IBInspectable public var pathPosition : Double {
        
        get {
            return currentState
        }
        
        set {
            if newValue < 0 {
                currentState = 0
            } else if newValue > 1 {
                currentState = 1
            } else {
                currentState = newValue
            }
            self.updateUI()
        }
    }
    
    private func prepareUI() {
        
        // Creating Paths
        let mainOvalPath = UIBezierPath(arcCenter: CGPoint(x:self.bounds.width/2,y:self.bounds.height/2), radius: (self.bounds.width * 0.4), startAngle: CGFloat(GLKMathDegreesToRadians(135)), endAngle: CGFloat(GLKMathDegreesToRadians(45)), clockwise: true)
        
        let subOvalPath = UIBezierPath(arcCenter: CGPoint(x:self.bounds.width/2,y:self.bounds.height/2), radius: (self.bounds.width * 0.4), startAngle: CGFloat(GLKMathDegreesToRadians(135)), endAngle: CGFloat(GLKMathDegreesToRadians(45)), clockwise: true)
        
        // Creating Layer 
        
        let mainOvalLayer = CAShapeLayer()
        mainOvalLayer.path = mainOvalPath.CGPath
        mainOvalLayer.fillColor = UIColor.clearColor().CGColor
        mainOvalLayer.lineWidth = CGFloat(20)
        
        let subOvalLayer = CAShapeLayer()
        subOvalLayer.path = subOvalPath.CGPath
        subOvalLayer.fillColor = UIColor.clearColor().CGColor
        subOvalLayer.lineWidth = CGFloat(20)

        
        // Adding as sublayer
        self.layer.addSublayer(mainOvalLayer)
        self.layer.addSublayer(subOvalLayer)
        
        self.mainOvalLayer = mainOvalLayer
        self.subOvalLayer = subOvalLayer
    }
    
    private func updateUI() {
        self.mainOvalLayer?.strokeColor = bgColor.CGColor
        self.subOvalLayer?.strokeColor = fgColor.CGColor
        self.subOvalLayer?.strokeEnd = CGFloat(weakSelf.currentState)

    }
    
    private var currentState = 0.5  {
        didSet {
            self.updateUI()
        }
    }
    
    /// UIView Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.prepareUI()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.prepareUI()
    }
    
    /// Layouting
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.updateUI()
    }
}

extension ArcView {
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.prepareUI()
        self.updateUI()
    }
}
