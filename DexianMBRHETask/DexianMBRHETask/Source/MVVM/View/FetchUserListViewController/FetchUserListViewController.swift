//
//  FetchUserListViewController.swift
//  DexianMBRHETask
//
//  Created by OrganicFarmers on 27/02/24.
//

import UIKit

class FetchUserListViewController: UIViewController {
    @IBOutlet weak var userListTableView: UITableView!
    
    var userViewModelObj: UserViewModel?
    
    var userModelListArray: [UserModel]? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.userListTableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userListTableView.registerCell(type: UserDetailsTableCell.self)

        fetchUserList()
    }
    
    private func fetchUserList() {
        userViewModelObj?.fetchUserList { [weak self] messageString, isSuccess, userModelList in
            self?.userModelListArray = userModelList
            if !isSuccess{
                DispatchQueue.main.async {
                    ActivityAndAlert.showAlert(with: messageString)
                }
            }
        }
    }

}

extension FetchUserListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userCell: UserDetailsTableCell = tableView.dequeueReusableCell(for: indexPath)
        userCell.userModel = userModelListArray?[indexPath.row]
        return userCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userModelListArray?.count ?? 0
    }
}
