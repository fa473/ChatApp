//
//  Channel.swift
//  Smack
//
//  Created by home on 12/31/17.
//  Copyright © 2017 home. All rights reserved.
//

import Foundation

struct Channel: Decodable {
    public private(set) var id: String!
    public private(set) var channelTitle: String!
    public private(set) var channelDescription: String!
}
