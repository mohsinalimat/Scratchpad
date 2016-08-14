//
//  ViewController.swift
//  IBDesignable-IBInspectable
//
//  Created by Sebastian Boldt on 14.08.16.
//  Copyright © 2016 Sebastian Boldt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stepper : UIStepper? {
        didSet {
            stepper?.addTarget(self, action: #selector(ViewController.stepperDidChangeValue), forControlEvents: UIControlEvents.ValueChanged)
        }
    }
    @IBOutlet weak var arcView : ArcView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc private func stepperDidChangeValue(sender:UIStepper) {
        self.arcView?.pathPosition = sender.value / 100
    }
}

