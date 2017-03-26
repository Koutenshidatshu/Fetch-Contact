//
//  NSData+toString.swift
//  ContactListFetch
//
//  Created by Yonathan on 3/3/17.
//  Copyright © 2017 Yonathan. All rights reserved.
//

import Foundation

extension NSData {
    
    func toString() -> String {
        return String(data: self, encoding: NSUTF8StringEncoding)!
    }
    
    func toDictionary() -> [String:AnyObject]? {
        do {
            return try NSJSONSerialization.JSONObjectWithData(self, options: []) as? [String:AnyObject]
        } catch let error as NSError {
        
        }
        return nil
    }
}