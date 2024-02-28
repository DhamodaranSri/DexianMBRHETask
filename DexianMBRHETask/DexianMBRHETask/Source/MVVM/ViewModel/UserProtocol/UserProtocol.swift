//
//  UserProtocol.swift
//  DexianMBRHETask
//
//  Created by OrganicFarmers on 27/02/24.
//

import Foundation

protocol UserProtocol {
    
    var userNameString: String? { get set }
    var emailIdString: String? { get set }
    var genderString: String? { get set }
    
    func createNewUser(_ completionHandler: @escaping (String?, Bool) -> Void )
    func fetchUserList(_ completionHandler: @escaping (String?, Bool, [UserModel]?) -> Void )
}
