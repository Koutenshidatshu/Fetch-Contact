//
//  AppDelegate.swift
//  ContactListFetch
//
//  Created by Yonathan on 3/1/17.
//  Copyright © 2017 Yonathan. All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let manager = NetworkReachabilityManager(host: "www.google.com")

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.rootViewController = MasterViewController()
        self.window!.makeKeyAndVisible()
        self.networkReachability()

        return true
    }
    func networkReachability(){
        
        manager?.listener = { status in
            print("Network Status Changed: \(status)")
            switch status {
            case .NotReachable:
                self.showAlertAppDelegate("Alert",message: "No Internet Connection",buttonTitle: "ok",window: self.window!);
            case .Reachable(_), .Unknown:
                self.showAlertAppDelegate("Alert",message: "Network Unknown",buttonTitle: "ok",window: self.window!);
                NSNotificationCenter.defaultCenter().postNotification(NSNotification.init(name: "Fetching", object: nil))
                //Hide error state
            }
        }
        
        manager?.startListening()
    }
    func showAlertAppDelegate(title : String,message : String,buttonTitle : String,window: UIWindow){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertActionStyle.Default, handler: nil))
        window.rootViewController?.presentViewController(alert, animated: true, completion: nil)
    }
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

