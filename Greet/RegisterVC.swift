//
//  RegisterVC.swift
//  Greet
//
//  Created by Sarah Raines on 4/5/19.
//  Copyright © 2019 Sarah Raines. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterVC: UIViewController {
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        
        let firstName = emailField.text!
        let lastName = passwordField.text!
        let email = emailField.text!
        let password = passwordField.text!
        let myAuth = Auth.auth()
        let alert = UIAlertController(title: "No title", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        if (email == "" || password == "" || firstName == "" || lastName == "") {
            alert.title = "Please enter all fields!"
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        myAuth.createUser(withEmail: email, password: password, completion: { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                
                if let errCode = AuthErrorCode(rawValue: error._code) {
                    
                    switch errCode {
                    case .invalidEmail:
                        alert.title = "Invalid email."
                    case .emailAlreadyInUse:
                        alert.title = "Email already in use."
                    case .weakPassword:
                        alert.title = "Password must have at least six characters."
                    default:
                        alert.title = "We are having trouble with use registration. Try again later!"
                    }
                    
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
                return
                
            }
            else {
                
            }
            //result?.user.uid
            
        })
    }
}

