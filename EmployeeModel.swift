//
//  EmployeeModel.swift
//  employees-list
//
//  Created by Artem Lugynets on 24.07.2023.
//

import Foundation

struct EmployeeStruct {
    let name: String
    let surname: String
    let gender: Gender
    let dateOfBirth: Date
    let salary: Double
    let department: String
}

enum Gender: Int16 {
    case male
    case female
    case other
}
