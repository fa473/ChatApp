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
                }
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
