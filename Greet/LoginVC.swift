//
//  ViewController.swift
//  Greet
//
//  Created by Sarah Raines on 4/4/19.
//  Copyright © 2019 Sarah Raines. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        
        let email = emailField.text!
        let password = passwordField.text!
        let myAuth = Auth.auth()
        let alert = UIAlertController(title: "No title", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        if (email == "" || password == "") {
            alert.title = "Please enter all fields!"
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        myAuth.signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                
                if let errCode = AuthErrorCode(rawValue: error!._code) {
                    
                    switch errCode {
                    case .userNotFound:
                        alert.title = "Invalid email or password."
                    case .wrongPassword:
                        alert.title = "Invalid email or password."
                    case .invalidEmail:
                        alert.title = "The email you entered is malformed."
                    case .userDisabled:
                        alert.title = "This account has been disabled."
                    default:
                        alert.title = "Oops! There seems to be an internal error."
                    }
                    
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
                return
                
            }
            else {
                
            }
            //result?.user.uid
        }
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "login2register", sender: self)
    }
}

