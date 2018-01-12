//
//  AppDelegate.swift
//  RealmDB
//
//  Created by Karunakar Bandikatla on 11/01/18.
//  Copyright © 2018 Karunakar Bandikatla. All rights reserved.
//

//Relations

import UIKit
import RealmSwift   

let uiRealm = try! Realm()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

}

