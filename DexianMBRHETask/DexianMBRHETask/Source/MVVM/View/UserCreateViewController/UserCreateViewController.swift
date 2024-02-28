//
//  ViewController.swift
//  DexianMBRHETask
//
//  Created by OrganicFarmers on 27/02/24.
//

import UIKit

class UserCreateViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!

    let userViewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func getUserListAction(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let fetchViewCtrl: FetchUserListViewController = storyBoard.instantiateViewController(withIdentifier: "FetchUserListViewController") as? FetchUserListViewController else {
            return
        }
        fetchViewCtrl.userViewModelObj = self.userViewModel
        self.navigationController?.pushViewController(fetchViewCtrl, animated: true)
        
        /// This is another Flow we can achive it
        /*
        userViewModel.fetchUserList { [weak self] messageString, isSuccess, userModelList  in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                guard let fetchViewCtrl: FetchUserListViewController = storyBoard.instantiateViewController(withIdentifier: "FetchUserListViewController") as? FetchUserListViewController, let self = self else {
                    return
                }
                fetchViewCtrl.userModelListArray = userModelList
                fetchViewCtrl.userViewModelObj = self.userViewModel
                self.navigationController?.pushViewController(fetchViewCtrl, animated: true)
            }
        }
         */
    }
    
    @IBAction func createUserAction(_ sender: UIButton) {
        userViewModel.userNameString = nameTextField.text
        userViewModel.genderString = genderTextField.text
        userViewModel.emailIdString = emailTextField.text
        userViewModel.createNewUser { [weak self] messageString, isSucess in
            DispatchQueue.main.async {
                if isSucess {
                    self?.nameTextField.text = ""
                    self?.emailTextField.text = ""
                    self?.genderTextField.text = ""
                }
                ActivityAndAlert.showAlert(with: messageString)
            }
        }
    }
    
}

extension UserCreateViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == nameTextField {
            return textField.isAlpahbatesWithSpace(textString: string, maximumTextLength: 30)
        } else if textField == genderTextField {
            return textField.isAlpahbates(textString: string, maximumTextLength: 10)
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
