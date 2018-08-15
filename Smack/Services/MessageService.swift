//
//  MessageService.swift
//  Smack
//
//  Created by home on 12/31/17.
//  Copyright © 2017 home. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    static let instance = MessageService()

    var channels = [Channel]()
    var messages = [Message]()
    var selectedChannel : Channel?
    var unreadChannels = [String]()

    func findAllChannels(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON
        { (response) in
            if response.result.isSuccess {
                guard let data = response.data else { return }
                if let json = try? JSON(data: data) {
                    for item in json["data"].arrayValue {
                        let name = item["name"].stringValue
                        let description = item["description"].stringValue
                        let id = item["_id"].stringValue
                        let channel = Channel(id: id, channelTitle: name, channelDescription: description)
                        self.channels.append(channel)
                    }
                    NotificationCenter.default.post(name: NOTIF_CHANNELS_LOADED, object: nil)
                    completion(true)
                }
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }

    func findAllMessagesForChannel(channelId: String, completion: @escaping CompletionHandler){
        Alamofire.request("\(URL_GET_MESSAGES)?channelId=\(channelId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON {(response) in

            if response.result.error == nil {
                self.clearMessages()
                guard let data = response.data else {return}
                if let json = try? JSON(data: data) {
                    for item in json["data"].arrayValue {
                        let messageBody = item["messageBody"].stringValue
                        let channelId = item["channelId"].stringValue
                        let userName = item["userName"].stringValue
                        let userAvatar = item["userAvatar"].stringValue
                        let userAvatarColor = item["userAvatarColor"].stringValue
                        let id = item["_id"].stringValue
                        let timeStamp = item["timeStamp"].stringValue

                        let message = Message(message: messageBody, userName: userName, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: id, timeStamp: timeStamp, channelId: channelId)
                        self.messages.append(message)
                    }
                    completion(true)
                }
            } else {
                debugPrint(response.result.error as Any)
                completion(false)
            }
        }
    }

    func clearMessages() {
        messages.removeAll()
    }

    func clearChannels() {
        channels.removeAll()
    }
}
