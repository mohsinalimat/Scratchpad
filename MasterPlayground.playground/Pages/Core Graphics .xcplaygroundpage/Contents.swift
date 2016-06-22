//: [Previous](@previous)

// Core Graphics 
// Basic Core Graphic Drawing Techniques

import Foundation
import UIKit

// Globals

let mainFrame = CGRectMake(0, 0, 200, 200)
/*******************************************/
// 1. CustomView using drawRect and UIBezierPath
/*******************************************/

@IBDesignable
class CustomView : UIView {
    
    // Call setNeedsDisplay or setNeedsDisplayInRect to update and not call it directly
    // each drawing operation will override its previous operation
    // Code inside drawrect will run before interface builder, so you just need to mark this class as IBDesignable
    
    @IBInspectable var fillColor = UIColor.redColor()
    @IBInspectable var strokeColor = UIColor.blueColor()
    @IBInspectable var lineWidth = 2.0
    
    override func drawRect(rect: CGRect) {
        
        // Context is provided for you automatically in drawRect
        // Just do the painting and it will automatically appear over here
        
        // UIBezierPath is wrapper for CGPath (Circles,Rectangles etc)
        let path = UIBezierPath(ovalInRect: CGRectMake(100, 100, 200, 200))
        path.lineWidth = CGFloat(self.lineWidth)
        self.fillColor.setFill()
        path.fill()
        
        self.strokeColor.setStroke()
        path.stroke()
    }
    
    override func prepareForInterfaceBuilder() {
        // Do some preparation for the InterfaceBuilder over here
    }
}

// Creating a custom view to show how that path will look like
var customView = CustomView(frame: CGRectMake(0,0,400,400))
customView.lineWidth = 10
customView.backgroundColor = UIColor.grayColor()


/*******************************************/
// 2. Creating an UIImage from a UIBezierPath
/*******************************************/
func createRoundedPathWithDashedLine()-> UIImage {
    let lineWidth = 10
    UIGraphicsBeginImageContext(CGSizeMake(200, 200))
    let path = UIBezierPath(ovalInRect: CGRectInset(CGRectMake(0, 0, 200, 200), CGFloat(lineWidth/2),CGFloat(lineWidth/2)))
    let dashes :[CGFloat]  = [10,20,50,20] // Gap,Stroke,Gap,Stroke
    UIColor.redColor().setStroke()
    path.lineWidth = 10
    path.setLineDash(dashes, count: 4, phase: 0)
    UIColor.blueColor().setFill()
    path.fill()
    path.stroke()
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
}

createRoundedPathWithDashedLine()

/*******************************************/
// 3. Clipping Path 
/*******************************************/

func createClippedImage()->UIImage {
    UIGraphicsBeginImageContext(CGSizeMake(200, 200))
    let clipArea = UIBezierPath(rect: CGRectMake(0, 0, 100, 100))
    clipArea.addClip()
    let path = UIBezierPath(ovalInRect: CGRectMake(0, 0, 200, 200))
    UIColor.redColor().setStroke()
    UIColor.blueColor().setFill()
    path.fill()
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
}

createClippedImage()

/*******************************************/
// 4. CAShapeLayer
/*******************************************/

let shapeLayer = CAShapeLayer()
shapeLayer.frame = mainFrame
let testPath = UIBezierPath(rect: CGRectInset(mainFrame, 10, 10))
testPath.lineWidth = 10
shapeLayer.path = testPath.CGPath
shapeLayer.strokeColor = UIColor.redColor().CGColor
var view = UIView(frame: mainFrame)
view.layer.addSublayer(shapeLayer)
view


//: [Next](@next)

