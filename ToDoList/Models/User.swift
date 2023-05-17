//
//  User.swift
//  ToDoList
//
//  Created by sakai on 13/05/2023.
//

import Foundation
struct User : Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
