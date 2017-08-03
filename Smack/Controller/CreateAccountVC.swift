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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var userImg: UIImageView!
    
    //variables
    var avatarName = "profileDefault"
    var colour = "[0.5,0.5,0.5,1]"
    var bgColour: UIColor?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && bgColour == nil {
                userImg.backgroundColor = UIColor.lightGray
            }
        }
    }
    

    @IBAction func createAccountButtonTapped(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        guard let username = usernameText.text , usernameText.text != "" else { return }
        guard let email = emailText.text , emailText.text != "" else { return }
        guard let pass = passwordText.text , passwordText.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: username, email: email, avatarName: self.avatarName, avatarColour: self.colour, completion: { (success) in
                            if success {
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                self.performSegue(withIdentifier: SEGUE_UNWIND_TO_CHANNEL, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
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
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        bgColour = UIColor(red: r, green: g, blue: b, alpha: 1)
        UIView.animate(withDuration: 0.2) {
            self.userImg.backgroundColor = self.bgColour
        }
        
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: SEGUE_UNWIND_TO_CHANNEL, sender: nil)
    }
    
    func setupView() {
        spinner.isHidden = true
        usernameText.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor: smackPurple])
        emailText.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor: smackPurple])
        passwordText.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: smackPurple])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
}
