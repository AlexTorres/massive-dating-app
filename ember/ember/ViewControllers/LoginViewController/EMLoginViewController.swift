//
//  EMLoginViewController.swift
//  ember
//
//  Created by John A Torres B on 5/06/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

import UIKit


class EMLoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var phoneTextField : UITextField
    @IBOutlet var passwordTextfield : UITextField
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneTextField.delegate = self
        passwordTextfield.delegate = self
        self.navigationController.navigationBar.hidden = true
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn (textField:UITextField) -> Bool {
        var nextTag = textField.tag + 1
        var nextResponder = textField.superview.viewWithTag(nextTag)
        
        if(nextResponder) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false;
    }
    
    @IBAction func loginButtonTapped(button:AnyObject) {
       var loginManager = EMLoginManager.sharedInstance()
        if(self.phoneTextField.text.bridgeToObjectiveC().length > 0 && self.passwordTextfield.text.bridgeToObjectiveC().length > 0) {
            loginManager.loginForPhone(self.phoneTextField.text,
                withPassword:self.passwordTextfield.text,
                success: {(respose:AnyObject!) -> Void in println("gatooo")},
                failure: {(error:NSError!) -> Void in
                    var errorString = error.userInfo["NSLocalizedRecoverySuggestion"]  as NSString;

                })
           
        }
        self.checkFields();
    }
    @IBAction func forgotButtonTapped(button:AnyObject) {
        println("button tapped!")
    }
    
    func checkFields () {
        for subview : AnyObject in self.view.subviews {
            if(subview is UITextField) {
                var textField = subview as UITextField;
                var length = textField.text.bridgeToObjectiveC().length;
                if (length == 0) {
                    textField.layer.borderColor = UIColor.redColor().CGColor
                    textField.layer.borderWidth = 1.0
                    
                } else {
                    textField.layer.borderColor = UIColor.clearColor().CGColor
                    textField.layer.borderWidth = 1.0
                }
            }
        }
    
    }
    /*
    // #pragma mark - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}
