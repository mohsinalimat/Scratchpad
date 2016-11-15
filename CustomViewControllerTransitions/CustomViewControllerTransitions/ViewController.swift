//
//  ViewController.swift
//  CustomViewControllerTransitions
//
//  Created by Sebastian Boldt on 14.11.16.
//  Copyright © 2016 Sebastian Boldt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func presentController(_ sender: Any) {
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "presentMe") {
            vc.modalPresentationStyle = .formSheet
            self.present(vc, animated: true, completion: nil)
        }
    }
}


class Animator: UIViewControllerTransitioningDelegate {
    
}

