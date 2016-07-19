//
//  ViewController.swift
//  PropertyAnimators
//
//  Created by Boldt, Sebastian on 19.07.16.
//  Copyright © 2016 Sebastian Boldt. All rights reserved.
//

import UIKit

// TODO:  UISpringTimingParameters etc.
// Stiffness - How elastic is the Spring
// Mass - How heavy is the Object is on the Spring
// Damping - How viscous is the water inside of it

class ViewController: UIViewController {
    
    @IBOutlet weak var toggleReverseButton :UIButton?
    
    var viewToAnimate : UIView?
    var isReversed = true
    var animator : UIViewPropertyAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.animator = UIViewPropertyAnimator(duration: 2, curve: .easeIn) { [weak self] in
            self?.viewToAnimate?.frame.origin = CGPoint(x: 0, y: 0)
        }
        
        self.animator?.isReversed = self.isReversed
        self.animator?.addCompletion { postion in
            print("Finished)")
        }
        self.viewToAnimate = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        self.viewToAnimate?.backgroundColor = UIColor.blue()
        if let viewToAnimate = viewToAnimate {
            self.view.addSubview(viewToAnimate)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewToAnimate?.center = self.view.center
    }
}

// MARK: Animation Button Handler
extension ViewController {
    @IBAction func startAnimation() {
        if let animator = self.animator where !animator.isRunning{
            animator.startAnimation()
        }
    }
    
    @IBAction func pauseAnimation() {
        if let animator = self.animator where animator.isRunning{
            animator.pauseAnimation()
        }
    }
        
    @IBAction func toggleReverse() {
        self.isReversed = !self.isReversed
        self.animator?.isReversed = self.isReversed
        if self.isReversed {
            self.toggleReverseButton?.setTitle("reversed", for: UIControlState())
        } else {
            self.toggleReverseButton?.setTitle("not reversed", for: UIControlState())
        }
    }
}

