//
//  ResponseArray.swift
//  ContactListFetch
//
//  Created by Yonathan on 3/4/17.
//  Copyright © 2017 Yonathan. All rights reserved.
//

import Foundation
import Gloss

struct ResponseArray: Decodable, Encodable {
    
    let status: Int?
    let message: String?
    let data: [Dictionary<String, AnyObject>]?
    
    init?(json: JSON) {
        self.status = "status" <~~ json
        self.message = "message" <~~ json
        self.data = ResponseArray.parseArray(("data" <~~ json)!)
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "status" ~~> self.status,
            "message" ~~> self.message,
            "data" ~~> self.data
            ])
    }
    
    static func parseArray(jsons: [JSON]) -> [Dictionary<String, AnyObject>]{
        var datas : [Dictionary<String, AnyObject>] = []
        for json in jsons {
            datas.append(json)
        }
        return datas
    }
}
