//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Jason Leocata on 1/8/17.
//  Copyright © 2017 Jason Leocata. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var userImg: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func createAccountButtonTapped(_ sender: Any) {
        guard let email = emailText.text , emailText.text != "" else { return }
        guard let pass = passwordText.text , passwordText.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                print("registered user")
            }
        }
    }
    
    @IBAction func chooseAvatarButtonTapped(_ sender: Any) {
    }
    
    @IBAction func generateBGColourTapped(_ sender: Any) {
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: SEGUE_UNWIND_TO_CHANNEL, sender: nil)
    }
}
