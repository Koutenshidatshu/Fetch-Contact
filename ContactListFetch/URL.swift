//
//  URL.swift
//  ContactListFetch
//
//  Created by Yonathan on 3/3/17.
//  Copyright © 2017 Yonathan. All rights reserved.
//

import UIKit
import Alamofire
import Gloss

struct URL {
    static let urlBaseApi = "http://gojek-contacts-app.herokuapp.com"
    static let getContacts = "http://gojek-contacts-app.herokuapp.com/contacts.json"
    static let urlGetDetails = "http://gojek-contacts-app.herokuapp.com/contacts/"
    static var Manager : Alamofire.Manager = {
        
        let pathToCert = NSBundle.mainBundle().pathForResource("test", ofType: "der")
        let localCertificate:NSData = NSData(contentsOfFile: pathToCert!)!
        
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            URL.urlBaseApi: .PinCertificates(
                certificates: [SecCertificateCreateWithData(nil, localCertificate)!],
                validateCertificateChain: true,
                validateHost: true
            )
        ]
        
        let manager = Alamofire.Manager(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        
        return manager
    }()

}