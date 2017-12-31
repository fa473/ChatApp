//
//  Channel.swift
//  Smack
//
//  Created by home on 12/31/17.
//  Copyright © 2017 home. All rights reserved.
//

import Foundation

struct Channel: Decodable {
    public private(set) var _id: String!
    public private(set) var name: String!
    public private(set) var description: String!
    public private(set) var __v: Int?
}
