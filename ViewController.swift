//
//  ViewController.swift
//  ThermoAlert
//
//  Created by Vien Minh Van on 2017-01-30.
//  Copyright © 2017 Vien Minh Van. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func loginAndDisplaysDevices(_ sender: Any) {
        
        SparkCloud.sharedInstance().login(withUser: "<#email#>", password: "<#password#>") { (error:Error?) -> Void in
            if error != nil {
                print("Wrong credentials or no internet connectivity, please try again")
            }
            else {
                print("Logged in")
            }
        }
        
        SparkCloud.sharedInstance().getDevices { (sparkDevices:[Any]?, error:Error?) -> Void in
            if error != nil {
                print("Check your internet connectivity")
            }
            else {
                if let devices = sparkDevices as? [SparkDevice] {
                    for device in devices {
                      print(device)
                    }
                }
            }
        }        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

