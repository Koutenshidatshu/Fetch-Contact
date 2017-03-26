//
//  MasterViewController.swift
//  ContactListFetch
//
//  Created by Yonathan on 3/3/17.
//  Copyright © 2017 Yonathan. All rights reserved.
//

import UIKit
import Alamofire
import Gloss
class MasterViewController: UIViewController {

    @IBOutlet var addressBookTable: UITableView!
    
    
    var allContacts : [ContactData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getDataContact()
        self.setupAddressBook()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func setupAddressBook() {
        self.addressBookTable.registerNib(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        self.addressBookTable.rowHeight = UITableViewAutomaticDimension
    }
    
    private func getDataContact(){
       
        let header = [
            "key" : "Content-Type",
            "value" : "application/json"
        ]
        
        let url = URL.urlBaseApi
        Alamofire.request(.GET, url, parameters:nil, headers: header, encoding: .JSON).responseJSON {
            response in
            
            switch response.result {
            case .Success:
    
                if let value = response.result.value as? [JSON] {
                    if (response.response?.statusCode == 200)
                    {
                        for json in value {
                            let nav = ContactData(json: json as JSON)
                            self.allContacts.append(nav!)
                        }
                        self.addressBookTable.reloadData()
                        
                    }
                }
                break
            case .Failure(let error):
//                dPrint(error)
                break
            }
        }
    }
}

    //delegate table
extension MasterViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allContacts.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCell")! as! TableViewCell
        let entry = allContacts[indexPath.row]
        let fullName : String! = entry.first_name! + " " + entry.last_name!
        cell.nameLabel.text = fullName
        
        //        cell.imagePic.image = setiimage
        //        if searchField.text == "" ||  searchField.text == " "{
        //            cell.fullname.text = entry.name
        //            cell.mobilePhonenumber.text = (entry.phone != nil) ? entry.phone : entry.email
        //        }else{
        //            let range = (entry.name.lowercaseString as NSString).rangeOfString((searchField.text?.lowercaseString)!)
        //            let attributedString = NSMutableAttributedString(string:entry.name)
        //            attributedString.addAttribute(NSForegroundColorAttributeName, value: OVOColor.Teal_1, range: range)
        //            cell.fullname.attributedText = attributedString
        //
        //            let text = (entry.phone != nil) ? entry.phone : entry.email
        //            let range2 = ((text!.lowercaseString as NSString)).rangeOfString((searchField.text?.lowercaseString)!)
        //            let attributedString2 = NSMutableAttributedString(string:text!)
        //            attributedString2.addAttribute(NSForegroundColorAttributeName, value: OVOColor.Teal_1, range: range2)
        //            cell.mobilePhonenumber.attributedText = attributedString2
        //        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //        let selectedContact = contacts[indexPath.row]
        //        dPrint("selected item :"+selectedContact.name)
        //        isFromAddressBook = true
        //        let method:String = (selectedContact.phone == nil) ? "email":"mobile"
        //        self.ovoMember = OVOCheckMember(fullname: selectedContact.name, email: selectedContact.email, phone:selectedContact.phone, image: selectedContact.image, method: method, level: 0)
        //        self.callBack?.goToTransferDetail(self.ovoMember, isAddressBook: self.isFromAddressBook, value: method)
        //        self.checkOvoMember(selectedContact)
    }
    
}

