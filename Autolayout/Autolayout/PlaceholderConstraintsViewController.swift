//
//  PlaceholderConstraintsViewController.swift
//  Autolayout
//
//  Created by Boldt, Sebastian on 29.07.16.
//  Copyright © 2016 Sebastian Boldt. All rights reserved.
//

import UIKit

class PlaceholderConstraintsViewController: UIViewController {
    
    @IBOutlet weak var imageView : UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareImageView("logo")
    }
}

extension PlaceholderConstraintsViewController {
    fileprivate func prepareImageView(_ name:String) {
        if let image = UIImage(named: name), let imageView = imageView {
            imageView.image = image
            let aspectRatio = (height:image.size.height,width:image.size.width)
            let multiplier = aspectRatio.height / aspectRatio.width
            let constraint = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: multiplier, constant: 0)
            self.view.addConstraint(constraint)
        }
    }
}



