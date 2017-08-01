//
//  ChannelVC.swift
//  Smack
//
//  Created by Jason Leocata on 1/8/17.
//  Copyright © 2017 Jason Leocata. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 100

    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: SEGUE_TO_LOGIN, sender: nil)
    }
    
}
