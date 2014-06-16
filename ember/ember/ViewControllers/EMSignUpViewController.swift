//
//  EMSignUpViewController.swift
//  ember
//
//  Created by John A Torres B on 9/06/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

import UIKit

class EMSignUpViewController: UIViewController {
   
    @IBOutlet var selectorContainer : UIView
    @IBOutlet var phoneTextField : UITextField
    @IBOutlet var passwordTextField : UITextField
    @IBOutlet var selectedCountryFlag : UIImageView
    @IBOutlet var countryTextField : UITextField

    
    var countries:EMCountryModel[]
    var countriesDictionary:NSDictionary
    var countrySelector:EMCountrySelectorViewController
    var countriesModel : EMCountriesModelResponse

    
    init(coder aDecoder: NSCoder!) {
        self.countriesDictionary = EMMiscUtils.countryListFromPlist() as NSDictionary
        self.countries = EMMiscUtils.countryList() as EMCountryModel[];
        self.countriesModel = EMCountriesModelResponse()
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
        self.countrySelector = storyboard.instantiateViewControllerWithIdentifier("CountrySelector") as EMCountrySelectorViewController
        super.init(coder: aDecoder)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var countriesManager = EMCountriesManager.sharedInstance()
        self.addChildViewController(self.countrySelector);
        self.selectorContainer.addSubview(self.countrySelector.view);
        countriesManager.countriesWithSuccess({(response:AnyObject!) -> Void in
            self.countriesModel = response as EMCountriesModelResponse
            println("gatooo")},
            failure: {(error:NSError!) -> Void in
            var errorString = error.userInfo["NSLocalizedRecoverySuggestion"]  as NSString;
            });
        
        //println(self.countriesDictionary)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
