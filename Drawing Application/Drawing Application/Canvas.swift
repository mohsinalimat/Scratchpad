//
//  Canvas.swift
//  Drawing Application
//
//  Created by Sebastian Boldt on 12.11.16.
//  Copyright © 2016 Sebastian Boldt. All rights reserved.
//

import UIKit

@IBDesignable
class Canvas: UIView {
    @IBInspectable
    public var strokeWidth : CGFloat = 4.0
    
    @IBInspectable
    public var strokeColor : UIColor = UIColor.black
    
    fileprivate var drawing: UIImage?
}

extension Canvas {
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            addLineFromPoint(from: touch.previousLocation(in: self), toPoint: touch.location(in: self))
        }
    }
    
    private func addLineFromPoint(from: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
        drawing?.draw(in: bounds)
        
        let cxt = UIGraphicsGetCurrentContext()
        cxt?.move(to: CGPoint(x: from.x, y: from.y))
        cxt?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        
        cxt?.setLineCap(.round)
        cxt?.setLineWidth(self.strokeWidth)
        self.strokeColor.setStroke()
        
        cxt?.strokePath()
        
        drawing = UIGraphicsGetImageFromCurrentImageContext()
        
        layer.contents = drawing?.cgImage
    }
}
