//: [Previous](@previous)

import Foundation
import UIKit
import XCPlayground

/// UViews will not be directly drawn to screen
/// They are backed by CALayers

/// UIView -> CALayer -> Hardware

/// LayerDelegate -> UIView
/// CALayers hav some really useful propertys a UIView does not have

/// • Shadows
/// • Borders
/// • Mask
/// • Mask to bounds
/// • Contents

/// CALayers have great Animation Suppport
/// Greate Propertys like Strokes, Shadows etc.
/// Layers is more efficient
/// Layers have great comback because flat desing has its come back
/// Layers can have sublayers


/// GOTO IBInspectable / IBDesignable for a real world example
/// CALayer
let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
mainView.backgroundColor = UIColor.whiteColor()
let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
button.setTitle("Press me", forState: .Normal) // . Normal wont be available in Swift 3.0
mainView.addSubview(button)

XCPlaygroundPage.currentPage.liveView = mainView
// Access a views layer using the .layer property
button.backgroundColor = UIColor.darkGrayColor()
button

button.layer.cornerRadius = button.frame.height/2
button

button.layer.borderWidth = 2.0
button.layer.borderColor = UIColor.greenColor().CGColor
button

button.layer.shadowColor = UIColor.darkGrayColor().CGColor
button.layer.shadowRadius = 4.0
button.layer.shadowOpacity = 0.4
button.layer.shadowOffset = CGSize.zero
button

/// This happens if you set the corner radius of a layer
let cornerDescription = UIImage(named: "corner")
cornerDescription

let image = UIImage(named:"rocket.jpg")
let imageView = UIImageView(image: image)
imageView.layer.masksToBounds = true
imageView.layer.cornerRadius = imageView.frame.size.width / 2
imageView.layer.borderWidth = 50
imageView.layer.borderColor = UIColor.whiteColor().CGColor
imageView

/// CAGradientLayer
let gradientDescription = UIImage(named: "gradient")
gradientDescription

/// USE LayoutSubview of your view to update Layers accordingly 
let gradientLayer = CAGradientLayer()
gradientLayer.frame = button.frame
gradientLayer.colors = [UIColor.blackColor().CGColor,UIColor.whiteColor().CGColor]
gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.25)
gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.75)
button.layer.addSublayer(gradientLayer)
button.layer.masksToBounds = true
button

/// CAShapeLayer
button.removeFromSuperview

/// Use UIBezierPath, a handy way to create CGPaths 
let rectPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 40, height: 40))
let ovalPath = UIBezierPath(ovalInRect: mainView.bounds)
ovalPath.lineWidth = 2.0
ovalPath

let roundedRect = UIBezierPath(roundedRect: mainView.frame, cornerRadius: 5)
roundedRect.lineWidth = 2.0
roundedRect

let customPath = UIBezierPath()
customPath.lineWidth = 5.0
customPath.moveToPoint(CGPoint(x: 0, y: 0))
customPath.addLineToPoint(CGPoint(x: 5, y: 5))
customPath.addLineToPoint(CGPoint(x: 10, y: 10))
customPath.addLineToPoint(CGPoint(x: 0, y: 0))

customPath.closePath()
customPath

//: [Next](@next)
