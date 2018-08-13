//
//  Constants.swift
//  Smack
//
//  Created by home on 12/27/17.
//  Copyright © 2017 home. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL Constants
let BASE_URL = "http://localhost:3030"
let URL_LOGIN = "\(BASE_URL)/authentication"
let URL_USER_ADD = "\(BASE_URL)/users"
let URL_USER_BY_EMAIL = "\(BASE_URL)/users"
let URL_GET_CHANNELS = "\(BASE_URL)/channel"
let URL_GET_MESSAGES = "\(BASE_URL)/message"

// Colors
let smackPurplePlaceholder = #colorLiteral(red: 0.2588235294, green: 0.3294117647, blue: 0.7254901961, alpha: 0.5046553938)

// Notification Constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")
let NOTIF_CHANNELS_LOADED = Notification.Name("channelsLoaded")
let NOTIF_CHANNEL_SELECTED = Notification.Name("channelSelected")

// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

// User defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
let BEARER_HEADER = [
    "Authorization":"Bearer \(AuthService.instance.authToken)",
    "Content-Type":"application/json; charset=utf-8"
]
