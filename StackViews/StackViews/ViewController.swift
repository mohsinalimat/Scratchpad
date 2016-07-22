//
//  ViewController.swift
//  StackViews
//
//  Created by Boldt, Sebastian on 22.07.16.
//  Copyright © 2016 Sebastian Boldt. All rights reserved.
//

import UIKit

//Embedding a StackView into a ScrollView
class ViewController: UIViewController {

    @IBOutlet weak var scrollView : UIScrollView?
    @IBOutlet weak var stackView  : UIStackView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addViewToStackScroll() {
        let button = UIButton()
        button.setTitleColor(UIColor.red(), for: UIControlState())
        button.setTitle("Added", for: UIControlState())
        self.stackView?.addArrangedSubview(button)
        
        // I used forced unwraps to speed up the things i wanted to test
        let offset  = (scrollView?.contentSize.height)! - (self.scrollView?.bounds.size.height)!
        self.scrollView?.setContentOffset(CGPoint(x:0,y:offset), animated: true)

    }
}

