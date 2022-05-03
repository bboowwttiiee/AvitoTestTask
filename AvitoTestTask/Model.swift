//
//  Model.swift
//  AvitoTestTask
//
//  Created by bowtie on 02.05.2022.
//

import Foundation

// MARK: - Companies
struct Avito: Codable {
    let company: Company
}

// MARK: - Company
struct Company: Codable {
    let name: String
    let employees: [Employee]
}

// MARK: - Employee
struct Employee: Codable {
    let name, number: String
    let skills: [String]

    enum CodingKeys: String, CodingKey {
        case name, skills
        case number = "phone_number"
    }
}
