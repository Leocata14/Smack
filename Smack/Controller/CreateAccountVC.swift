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
    
    //variables
    var avatarName = "profileDefault"
    var colour = "[0.5,0.5,0.5,1]"
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    

    @IBAction func createAccountButtonTapped(_ sender: Any) {
        guard let username = usernameText.text , usernameText.text != "" else { return }
        guard let email = emailText.text , emailText.text != "" else { return }
        guard let pass = passwordText.text , passwordText.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: username, email: email, avatarName: self.avatarName, avatarColour: self.colour, completion: { (success) in
                            if success {
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: SEGUE_UNWIND_TO_CHANNEL, sender: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func chooseAvatarButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: SEGUE_TO_AVATAR, sender: nil)
    }
    
    @IBAction func generateBGColourTapped(_ sender: Any) {
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: SEGUE_UNWIND_TO_CHANNEL, sender: nil)
    }
}
