//
//  UserViewModel.swift
//  DexianMBRHETask
//
//  Created by OrganicFarmers on 27/02/24.
//

import Foundation

class UserViewModel: UserProtocol {

    var userNameString: String?
    var emailIdString: String?
    var genderString: String?
    
    func createNewUser(_ completionHandler: @escaping (String?, Bool) -> Void) {
        guard let userNameString = userNameString,
              let emailIdString = emailIdString,
              emailIdString.isValidEmail(),
              let genderString = genderString else {
            completionHandler("Please check the textFields", false)
            return
        }

        ActivityAndAlert.showLoader()

        let createUser = UserModel(name: userNameString, email: emailIdString, gender: genderString)
        APIManager.shared.getDataFromServer(endPoints: .createNewUser(model: createUser)) { response, error, statusCode in
            DispatchQueue.main.async {
                ActivityAndAlert.dismissAlertOrLoaded()
            }
            guard statusCode == 201, (response != nil) else {
                completionHandler("Somthing Went Wrong", false)
                return
            }
            completionHandler("Sucess", true)
        }
    }
    
    func fetchUserList(_ completionHandler: @escaping (String?, Bool, [UserModel]?) -> Void) {

        ActivityAndAlert.showLoader()
        APIManager.shared.getDataFromServer(endPoints: .getUserList) { response, error, statusCode in
            DispatchQueue.main.async {
                ActivityAndAlert.dismissAlertOrLoaded()
            }
            guard statusCode == 200, let data = response else {
                completionHandler("Something Went Wrong", false, nil)
                return
            }
            completionHandler("Sucess", true, data.dataParser(dataToModel: [UserModel].self))
        }
    }
    
    
}

extension String {

    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
}
