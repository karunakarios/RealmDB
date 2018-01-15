//
//  ViewController.swift
//  RealmDB
//
//  Created by Karunakar Bandikatla on 11/01/18.
//  Copyright © 2018 Karunakar Bandikatla. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var employeesTable: UITableView!
    var employees: Results<Employee>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Employees"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addEmployee))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reload()
    }
    
    private func reload() {
        employees = uiRealm.objects(Employee.self)  //Realm READ
        employeesTable.reloadData()
    }
    
    @objc private func addEmployee() {
        self.performSegue(withIdentifier: "addemployee", sender: self)
    }
    
     // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addEmpViewController = segue.destination as! AddEmployeeViewController
        addEmpViewController.employee = sender as? Employee
     }
 
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employee")
        let emp: Employee = employees[indexPath.row]
        cell?.textLabel?.text = "\(emp.id). \(emp.name) (\(emp.empID))"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employee = self.employees[indexPath.row]
        self.performSegue(withIdentifier: "addemployee", sender: employee)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (deleteAction, indexPath) -> Void in
            let employee = self.employees[indexPath.row]
            try! uiRealm.write{
                uiRealm.delete(employee)
                self.reload()
            }
        }
        return [deleteAction]
    }
    
}
