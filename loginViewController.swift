//
//  loginViewController.swift
//  firebase1
//
//  Created by Akshay Devkate on 11/11/19.
//  Copyright © 2019 Akshay Devkate. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class loginViewController: UIViewController {

    @IBOutlet weak var emailIdTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    
    func setUpElements()
    {
        errorLabel.alpha = 0
        
        Utilities.styleTextField(emailIdTextField)
            
        Utilities.styleTextField(passwordTextField)
        
        Utilities.styleFilledButton(LoginButton)
    
    }

    @IBAction func loginTapped(_ sender: Any) {
        
        // TODO: Validate Text Fields
            
            // Create cleaned versions of the text field
            let email = emailIdTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Signing in the user
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                if error != nil {
                    // Couldn't sign in
                    self.errorLabel.text = error!.localizedDescription
                    self.errorLabel.alpha = 1
                }
                else {
                    
                    let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? homeViewController
                    
                    self.view.window?.rootViewController = homeViewController
                    self.view.window?.makeKeyAndVisible()
                }
            }
        }
    }
    


