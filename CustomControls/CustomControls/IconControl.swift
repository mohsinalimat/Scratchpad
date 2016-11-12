//
//  IconControl.swift
//  CustomControls
//
//  Created by Sebastian Boldt on 12.11.16.
//  Copyright © 2016 Sebastian Boldt. All rights reserved.
//

import UIKit

class IconControl: UIView {
    fileprivate lazy var imageView : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    fileprivate lazy var label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: UIFontWeightLight)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
}

extension IconControl {
    var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
        }
    }
    
    var text: String? {
        get {
            return self.label.text
        }
        
        set {
            self.label.text = newValue
        }
    }
}

extension IconControl {
    fileprivate func sharedInit() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
        addSubview(imageView)
        
        let spacingConstraint = label.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 20)
        NSLayoutConstraint.activate([
                imageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
                imageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
                imageView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
                spacingConstraint,
                label.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor),
                imageView.centerYAnchor.constraint(equalTo: label.centerYAnchor)
        ])
        
        label.setContentHuggingPriority(UILayoutPriorityDefaultHigh, for: .horizontal)
        imageView.setContentHuggingPriority(UILayoutPriorityDefaultHigh, for: .horizontal)
        setContentHuggingPriority(UILayoutPriorityDefaultHigh, for: .horizontal)
        
        layer.cornerRadius = 10
    }
}
