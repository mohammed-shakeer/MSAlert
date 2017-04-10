//
//  ViewController.swift
//  MSAlert
//
//  Created by mohammed-shakeer on 02/24/2017.
//  Copyright (c) 2017 mohammed-shakeer. All rights reserved.
//

import UIKit
import MSAlert

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func alert(_ sender: Any) {
        
        UIAlertController.showAlertIn(viewController: self,
                                      title: "Alert",
                                      message: "This is my alert",
                                      cancelTitle: "Cancel",
                                      destructiveTitle: nil,
                                      otherTitles:nil,
                                      tappedAction:nil)
    }
    
    @IBAction func action(_ sender: Any) {
        
        UIAlertController.showActionsheetIn(viewController: self
            , title: nil,
              message: "This is my action sheet",
              cancelTitle: "Cancel",
              destructiveTitle: "Delete",
              otherTitles: ["Action1"],
              popOverView: sender,
              permittedArrowDirections: .unknown,
              tappedAction: nil)
    }
    
}

