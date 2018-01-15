//
//  Employee.swift
//  RealmDB
//
//  Created by Karunakar Bandikatla on 11/01/18.
//  Copyright © 2018 Karunakar Bandikatla. All rights reserved.
//

import RealmSwift

class Employee: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var empID: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var isManager: Bool = false
    
    override static func primaryKey() -> String? {
         return "id"
    }
    
    class func incrementID() -> Int {
        let realm = try! Realm()
        let id =  (realm.objects(Employee.self).max(ofProperty: "id") as Int? ?? 0) + 1
        return id
    }
    
}
