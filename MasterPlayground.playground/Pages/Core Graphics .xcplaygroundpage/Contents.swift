//: [Previous](@previous)

// Core Graphics 
// Basic Core Graphic Drawing Techniques

import Foundation
import UIKit

// Globals

let mainFrame = CGRect(x:0, y:0, width:200, height:200)
/*******************************************/
// 1. CustomView using drawRect and UIBezierPath
/*******************************************/

@IBDesignable
class CustomView : UIView {
    
    // Call setNeedsDisplay or setNeedsDisplayInRect to update and not call it directly
    // each drawing operation will override its previous operation
    // Code inside drawrect will run before interface builder, so you just need to mark this class as IBDesignable
    
    @IBInspectable var fillColor = UIColor.red
    @IBInspectable var strokeColor = UIColor.blue
    @IBInspectable var lineWidth = 2.0
    
    override func draw(_ rect: CGRect) {
        
        // Context is provided for you automatically in drawRect
        // Just do the painting and it will automatically appear over here
        
        // UIBezierPath is wrapper for CGPath (Circles,Rectangles etc)
        let path = UIBezierPath(ovalIn: CGRect(x: 100, y: 100, width: 200, height: 200))
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
var customView = CustomView(frame: CGRect(x: 0,y: 0,width: 400,height: 400))
customView.lineWidth = 10
customView.backgroundColor = UIColor.gray


/*******************************************/
// 2. Creating an UIImage from a UIBezierPath
/*******************************************/
func createRoundedPathWithDashedLine()-> UIImage {
    let lineWidth = 10
    UIGraphicsBeginImageContext(CGSize(width: 200, height: 200))
    let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 200, height: 200).insetBy(dx: CGFloat(lineWidth/2),dy: CGFloat(lineWidth/2)))
    let dashes :[CGFloat]  = [10,20,50,20] // Gap,Stroke,Gap,Stroke
    UIColor.red.setStroke()
    path.lineWidth = 10
    path.setLineDash(dashes, count: 4, phase: 0)
    UIColor.blue.setFill()
    path.fill()
    path.stroke()
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
}

createRoundedPathWithDashedLine()

/*******************************************/
// 3. Clipping Path 
/*******************************************/

func createClippedImage()->UIImage {
    UIGraphicsBeginImageContext(CGSize(width: 200, height: 200))
    let clipArea = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 100, height: 100))
    clipArea.addClip()
    let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 200, height: 200))
    UIColor.red.setStroke()
    UIColor.blue.setFill()
    path.fill()
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
}

createClippedImage()

/*******************************************/
// 4. CAShapeLayer
/*******************************************/

let shapeLayer = CAShapeLayer()
shapeLayer.frame = mainFrame
let testPath = UIBezierPath(rect: mainFrame.insetBy(dx: 10, dy: 10))
testPath.lineWidth = 10
shapeLayer.path = testPath.cgPath
shapeLayer.strokeColor = UIColor.red.cgColor
var view = UIView(frame: mainFrame)
view.layer.addSublayer(shapeLayer)
view

//: [Next](@next)

