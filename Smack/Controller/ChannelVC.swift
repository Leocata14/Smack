//
//  ChannelVC.swift
//  Smack
//
//  Created by Jason Leocata on 1/8/17.
//  Copyright © 2017 Jason Leocata. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var loginButton: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userImage: CircleImage!
    var statusBarShouldBeHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        SocketService.instance.getChannel { (success) in
            if success {
                self.tableView.reloadData()
            }
        }
        .com
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 100
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        
        
        statusBarShouldBeHidden = true
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUserInfo()
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        setupUserInfo()
    }
    
    
    func setupUserInfo() {
        if AuthService.instance.isLoggedIn {
            loginButton.setTitle(UserDataService.instance.name, for: .normal)
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            userImage.backgroundColor = UserDataService.instance.returnUIColour(components: UserDataService.instance.avatarColour)
        } else {
            loginButton.setTitle("Login", for: .normal)
            userImage.image = UIImage(named: "menuProfileIcon")
            userImage.backgroundColor = UIColor.clear
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: SEGUE_TO_LOGIN, sender: nil)
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? ChannelCell {
            let channel = MessageService.instance.channels[indexPath.row]
            cell.configureCell(channel: channel)
            return cell
        } else {
            return ChannelCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.channels.count
    }
    
    @IBAction func addChannelTapped(_ sender: Any) {
        let channel = AddChannelVC()
        channel.modalPresentationStyle = .custom
        present(channel, animated: true, completion: nil)
    }

}
