//
//  AddChannelVC.swift
//  Smack
//
//  Created by Jason Leocata on 9/8/17.
//  Copyright © 2017 Jason Leocata. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        nameTextField.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor: smackPurple])
        descriptionTextField.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedStringKey.foregroundColor: smackPurple])
    }
    
    @objc func closeTap(_ recogniser: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func closeModalTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        print("tapped")
        guard let channelName = nameTextField.text , nameTextField.text != "" else {return}
        guard let channelDescription = descriptionTextField.text , descriptionTextField.text != "" else {return}
        
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDescription) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
