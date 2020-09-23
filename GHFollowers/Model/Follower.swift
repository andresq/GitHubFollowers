//
//  Follower.swift
//  GHFollowers
//
//  Created by Andres Quintero on 8/26/20.
//  Copyright © 2020 Andres Quintero. All rights reserved.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
}
