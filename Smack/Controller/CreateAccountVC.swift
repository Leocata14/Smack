//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Jason Leocata on 1/8/17.
//  Copyright © 2017 Jason Leocata. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func closeButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: SEGUE_UNWIND_TO_CHANNEL, sender: nil)
    }
}
