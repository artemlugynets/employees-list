//
//  Employee.swift
//  employees-list
//
//  Created by Artem Lugynets on 24.07.2023.
//

import Foundation
import CoreData

class Employee: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var surname: String
    @NSManaged var gender: Int16
    @NSManaged var dateOfBirth: Date
    @NSManaged var salary: Double
    @NSManaged var department: String
}
