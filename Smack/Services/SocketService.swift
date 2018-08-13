//
//  SocketService.swift
//  Smack
//
//  Created by home on 1/2/18.
//  Copyright © 2018 home. All rights reserved.
//

import UIKit
import Feathers
import FeathersSwiftSocketIO
import ReactiveSwift
import SocketIO

class SocketService: NSObject {

    static let instance = SocketService()

    override init() {
      super.init()
    }

    // let manager = SocketManager(socketURL: URL(string: BASE_URL)!)
    let manager = SocketManager(socketURL: URL(string: BASE_URL)!, config: [.log(false), .compress])
    lazy var socket:SocketIOClient = manager.defaultSocket

    func establishConnection() {
        socket.connect()
    }

    func closeConnection() {
        socket.disconnect()
    }

    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }

    func getChannel(completion: @escaping CompletionHandler) {
        socket.on("channelCreated") { (dataArray, ack) in
            print(dataArray)
            guard let channelName = dataArray[0] as? String else {return}
            guard let channelDesc = dataArray[1] as? String else {return}
            guard let channelId = dataArray[2] as? String else {return}

            let newChannel = Channel(id: channelId, channelTitle: channelName, channelDescription: channelDesc)

            MessageService.instance.channels.append(newChannel)
            completion(true)

        }
    }

    func addMessage(messageBody: String, userId:String, channelId: String, completion: @escaping CompletionHandler){
        let user = UserDataService.instance
        socket.emit("newMessage", messageBody, userId, channelId, user.name, user.avatarName, user.avatarColor)
        completion(true)
    }
}
