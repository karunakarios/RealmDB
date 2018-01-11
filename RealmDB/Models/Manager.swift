//
//  Manager.swift
//  RealmDB
//
//  Created by Karunakar Bandikatla on 11/01/18.
//  Copyright © 2018 Karunakar Bandikatla. All rights reserved.
//

import RealmSwift

class Manager: Employee {
    let reportees = List<Employee>()
}
