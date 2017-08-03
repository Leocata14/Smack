//
//  Constants.swift
//  Smack
//
//  Created by Jason Leocata on 1/8/17.
//  Copyright © 2017 Jason Leocata. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//URL Constants
let URL_BASE = "https://leocata14-smack.herokuapp.com/v1/"
let URL_REGISTER = "\(URL_BASE)account/register"
let URL_LOGIN = "\(URL_BASE)account/login"
let URL_USER_ADD = "\(URL_BASE)user/add"

//Colours
let smackPurple = #colorLiteral(red: 0.2588235294, green: 0.3294117647, blue: 0.7254901961, alpha: 0.5)

//Notification Contactns
let notid = NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")

//Seqgues
let SEGUE_TO_LOGIN = "toLogin"
let SEGUE_TO_CREATE_ACCOUNT = "toCreateAccount"
let SEGUE_UNWIND_TO_CHANNEL = "unwindToChannel"
let SEGUE_TO_AVATAR = "toAvatarPicker"

//User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
