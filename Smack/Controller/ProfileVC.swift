//
//  ProfileVC.swift
//  Smack
//
//  Created by Jason Leocata on 9/8/17.
//  Copyright © 2017 Jason Leocata. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        usernameLabel.text = UserDataService.instance.name
        userEmailLabel.text = UserDataService.instance.email
        profileImage.image = UIImage(named: UserDataService.instance.avatarName)
        profileImage.backgroundColor = UserDataService.instance.returnUIColour(components: UserDataService.instance.avatarColour)
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
        backgroundView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ recogniser: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }

    @IBAction func logoutTapped(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeModalTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
