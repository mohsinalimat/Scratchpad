//
//  IntrinsicContentSizeDemoViewController.swift
//  Autolayout
//
//  Created by Boldt, Sebastian on 29.07.16.
//  Copyright © 2016 Sebastian Boldt. All rights reserved.
//

import UIKit

class IntrinsicContentSizeDemoViewController: UIViewController {

}

class CustomView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.prepareView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.prepareView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.prepareView()
    }
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 200, height: 400)
    }
    
    private func prepareView() {
        self.backgroundColor = UIColor.red()
    }
}

