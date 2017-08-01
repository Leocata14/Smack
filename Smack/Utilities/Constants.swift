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

//Seqgues
let SEGUE_TO_LOGIN = "toLogin"
let SEGUE_TO_CREATE_ACCOUNT = "toCreateAccount"
let SEGUE_UNWIND_TO_CHANNEL = "unwindToChannel"

//User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
