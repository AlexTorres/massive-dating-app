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
    
    @IBAction func loginButtonTapped(button:UIButton) {
        println("button tapped!")
    }
    @IBAction func forgotButtonTapped(button:UIButton) {
        println("button tapped!")
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
