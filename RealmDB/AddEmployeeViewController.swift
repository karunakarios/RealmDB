//
//  AddEmployeeViewController.swift
//  RealmDB
//
//  Created by Karunakar Bandikatla on 11/01/18.
//  Copyright © 2018 Karunakar Bandikatla. All rights reserved.
//

import UIKit

class AddEmployeeViewController: UIViewController {
    
    @IBOutlet weak var tfID: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var switchManager: UISwitch!
    
    var employee: Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfID.keyboardType = .numberPad
        setData()
    }
    
    private func isEditScreen() -> Bool {
        return employee != nil
    }
    
    private func setData() {
        self.title = "Add Employee"
        if let emp = employee {
            self.title = emp.name
            self.tfID.text = emp.empID
            self.tfName.text = emp.name
            self.switchManager.setOn(emp.isManager, animated: false)
        }
    }

    @IBAction func saveEmployee(_ sender: Any) {
        let empID = tfID.text
        let empName = tfName.text
        let isManager = switchManager.isOn
        
        if isEditScreen() {
            try! uiRealm.write {   //Ream EDIT
                if let emp  = employee {
                    emp.empID = empID!
                    emp.name = empName!
                    emp.isManager = isManager
                }
                self.navigationController?.popViewController(animated: true)
            }
        }
        
        else {
            let emp = Employee()
            emp.empID = empID!
            emp.name = empName!
            emp.isManager = isManager
            emp.id = Employee.incrementID()
            
            try! uiRealm.write {   //Ream ADD
                uiRealm.add(emp)
                self.navigationController?.popViewController(animated: true)
            }
        }
        

    }
    
}
