//
//  ViewController.swift
//  Dapur Coklat Indosis
//
//  Created by Danial Habibi on 3/17/18.
//  Copyright © 2018 Indosis. All rights reserved.
//

import UIKit
import Toast_Swift
import os.log
class ViewController: UIViewController {

    //MARK : Properties
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func passFieldAction(_ sender: Any) {
        login()
    }
    //MARK : Action
    @IBAction func SignIn(_ sender: UIButton) {
       login()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 1
        let nav = self.navigationController?.navigationBar
        
        // 2
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.yellow
        
        // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        // 4
        let image = UIImage(named: "logo-dapur-coklat")
        imageView.image = image
        
        // 5
        navigationItem.titleView = imageView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func login()
    {
        let username = self.usernameField.text ?? ""
        let password = self.passwordField.text ?? ""
        print(username)
        //self.view.makeToast("Login Using "+username, duration: 3.0, position: .center)
        
        APIManager.sharedInstance.getUserLogin(username: username, password: password, onSuccess: {json in DispatchQueue.main.async {
            let status = json["status"].stringValue
            let user = json["user"].stringValue
            let name = json["name"].stringValue
            let msisdn = json["msisdn"].stringValue
            let key_session = json["key_session"].stringValue
            if status == "OK"
            {
                self.view.makeToast("Got key_session "+key_session, duration: 3.0, position: .center)
                // let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                // let initViewController: UIViewController = storyboard.instantiateViewController(withIdentifier: "mainView") as UIViewController
                
                //self.present(initViewController, animated: true, completion: nil)'
                let defaults = UserDefaults.standard
                defaults.set(user, forKey: "user")
                defaults.set(name, forKey: "name")
                defaults.set(key_session,forKey:"key_session")
                defaults.set(msisdn,forKey: "msisdn")
                defaults.synchronize()
                
                self.performSegue(withIdentifier: "mainView", sender: nil)
            }else{
                self.view.makeToast("Failed To get  key_session "+key_session, duration: 3.0, position: .center)
            }
            
            }}, onFailure: {error in let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.show(alert, sender: nil)
        })
        
        
        os_log("Login Using Username :  ", log: OSLog.default, type: .debug)
    }

}

