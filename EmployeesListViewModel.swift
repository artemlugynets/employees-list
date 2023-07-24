//
//  EmployeesListViewModel.swift
//  employees-list
//
//  Created by Artem Lugynets on 24.07.2023.
//

import Foundation
import CoreData

class EmployeesListViewModel {
    private var employees: [EmployeeStruct] = []
    private var departments: [String] = []

    var numberOfSections: Int {
        return departments.count
    }

    func numberOfEmployees(in section: Int) -> Int {
        let department = departments[section]
        return employees.filter { $0.department == department }.count
    }

    func employee(at indexPath: IndexPath) -> EmployeeStruct {
        let department = departments[indexPath.section]
        let departmentEmployees = employees.filter { $0.department == department }
        return departmentEmployees[indexPath.row]
    }

    func departmentName(for section: Int) -> String {
        return departments[section]
    }

    func fetchEmployees() {
            let context = CoreDataStack.shared.persistentContainer.viewContext
            
            let fetchRequest: NSFetchRequest<Employee> = NSFetchRequest(entityName: "Employee")

            do {
                let employeeEntities = try context.fetch(fetchRequest)
                employees = employeeEntities.map { employeeEntity in
                    let name = employeeEntity.name 
                    let surname = employeeEntity.surname 
                    let gender = Gender(rawValue: employeeEntity.gender) ?? .male
                    let dateOfBirth = employeeEntity.dateOfBirth 
                    let salary = employeeEntity.salary
                    let department = employeeEntity.department 
                    return EmployeeStruct(name: name, surname: surname, gender: gender, dateOfBirth: dateOfBirth, salary: salary, department: department)
                }

                // Group employees by department
                departments = Array(Set(employees.map { $0.department }))
                departments.sort()
            } catch {
                print("Error fetching employees: \(error)")
            }
        }
}

