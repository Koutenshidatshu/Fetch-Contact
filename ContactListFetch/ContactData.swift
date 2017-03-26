//
//  ContactData.swift
//  ContactListFetch
//
//  Created by Yonathan on 3/3/17.
//  Copyright © 2017 Yonathan. All rights reserved.
//
import Foundation
import Gloss
//\"id\": 166,
//\"first_name\": \"1bin\",
//\"last_name\": \"mmm\",
//\"profile_pic\": \"\/images\/missing.png\",
//\"url\": \"http: \/\/gojek-contacts-app.herokuapp.com\/contacts\/166.json\"
struct ContactData: Decodable, Encodable {
    let id: Int?
    let first_name: String?
    let last_name: String?
    let profile_pic: String?
    let url : String?
    
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
