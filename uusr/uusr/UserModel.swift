//
//  UserModel.swift
//  uusr
//
//  Created by Jianming Chen on 2024-11-07.
//

import Foundation

enum UserRole{
    case manager
    case individual
}

struct User: Identifiable{
    let id = UUID()
    var email: String
    var password: String
    var role: UserRole
    var firstName: String
    var lastName: String
    var unitNumber: String?
    var buildingName:String?
}
