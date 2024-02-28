//
//  UserModel.swift
//  DexianMBRHETask
//
//  Created by OrganicFarmers on 27/02/24.
//

import Foundation

struct UserModel: Codable {
    var id : Int? = 0
    let name : String?
    let email : String?
    let gender : String?
    var status : String? = "active"
}
