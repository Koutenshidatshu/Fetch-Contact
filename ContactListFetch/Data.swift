//
//  Data.swift
//  ContactListFetch
//
//  Created by Yonathan on 3/4/17.
//  Copyright © 2017 Yonathan. All rights reserved.
//

import Foundation
import Gloss
struct Data: Decodable, Encodable  {
    let id: String?
    let first_name: String?
    let last_name: String?
    let profile_pic: String?
    let url : Int?
    
    init?(json: JSON) {
        self.id = "id" <~~ json
        self.first_name = "first_name" <~~ json
        self.last_name = "last_name" <~~ json
        self.profile_pic = "profile_pic" <~~ json
        self.url = "url" <~~ json
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "id" ~~> self.id,
            "first_name" ~~> self.first_name,
            "last_name" ~~> self.last_name,
            "profile_pic" ~~> self.profile_pic,
            "url" ~~> self.url,
            ])
    }
}

