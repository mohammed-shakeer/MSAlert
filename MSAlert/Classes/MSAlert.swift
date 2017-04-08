//
//  MSAlert.swift
//  Pods
//
//  Created by Mohammed Shakeer on 2/18/17.
//
//

import Foundation

let CANCEL_BUTTON_INDEX =  -1
let DESTRUCTIVE_BUTTON_INDEX  =  0

extension UIAlertController{
    
    open class func showAlertIn(viewController: UIViewController,
                         title: String,
                         message: String,
                         cancelTitle: String,
                         destructiveTitle: String,
                         OtherTitles: [String],
                         tappedAction: ((UIAlertController, UIAlertAction, NSInteger) -> Void)?){

        
        showIn(viewController: viewController,
               title: title,
               message: message,
               preferredStyle: .alert,
               cancelTitle: cancelTitle,
               destructiveTitle: destructiveTitle,
               OtherTitles: OtherTitles,
               popOverView: nil,
               permittedArrowDirections: .unknown) { (alert, action, index) in
                
        }
    }
    
    open class func showActionsheetIn(viewController: UIViewController,
                                 title: String,
                                 message: String,
                                 cancelTitle: String,
                                 destructiveTitle: String,
                                 OtherTitles:[String],
                                 popOverView: Any,
                                 permittedArrowDirections: UIPopoverArrowDirection,
                                 tappedAction: ((UIAlertController, UIAlertAction, NSInteger) -> Void)?){
        
        showIn(viewController: viewController,
               title: title,
               message: message,
               preferredStyle: .actionSheet,
               cancelTitle: cancelTitle,
               destructiveTitle: destructiveTitle,
               OtherTitles: OtherTitles,
               popOverView: popOverView,
               permittedArrowDirections: .unknown) { (alert, action, index) in
                
        }
    }
    
    class func showIn(viewController: UIViewController,
                      title: String,
                      message: String,
                      preferredStyle: UIAlertControllerStyle,
                      cancelTitle: String,
                      destructiveTitle: String,
                      OtherTitles:[String],
                      popOverView: Any?,
                      permittedArrowDirections: UIPopoverArrowDirection,
                      tappedAction: ((UIAlertController, UIAlertAction, NSInteger) -> Void)?){
        
        
        let alertController = self.init(title: title, message: message, preferredStyle: preferredStyle)

        if cancelTitle != nil {
            alertController.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: { (action) in
                
                if tappedAction != nil{
                    tappedAction!(alertController, action, CANCEL_BUTTON_INDEX)
                }
            }))
        }
        
        if destructiveTitle != nil {
            alertController.addAction(UIAlertAction(title: destructiveTitle, style: .destructive, handler: { (action) in
                
                if tappedAction != nil{
                    tappedAction!(alertController, action, DESTRUCTIVE_BUTTON_INDEX)
                }
            }))
        }
        
        var i = 0
        for otherTitle in OtherTitles {
            
            alertController.addAction(UIAlertAction(title: otherTitle, style: .default, handler: { (action) in
                
                if tappedAction != nil{
                    tappedAction!(alertController, action, i+1)
                }
            }))
                
                i += 1;
        }
        
        //For Actionsheet
        if popOverView is UIBarButtonItem {
            alertController.popoverPresentationController?.barButtonItem = popOverView as! UIBarButtonItem
        }
        else if popOverView is UIView {
            
            let popOver = popOverView as! UIView
            
            let rect = CGRect(x: 0.0, y: 0.0, width: popOver.frame.width, height: popOver.frame.height)
            alertController.popoverPresentationController?.sourceView = popOver
            alertController.popoverPresentationController?.sourceRect = rect
        }
        
        alertController.popoverPresentationController?.permittedArrowDirections = permittedArrowDirections
        viewController.present(alertController, animated: true, completion: nil)
    }

}
