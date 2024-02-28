//
//  UserDetailsTableCell.swift
//  DexianMBRHETask
//
//  Created by OrganicFarmers on 28/02/24.
//

import UIKit

class UserDetailsTableCell: UITableViewCell {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailIdLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var userModel: UserModel? {
        didSet {
            updateUI()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI() {
        guard let userModelObj = userModel else {
            return
        }
        userNameLabel.text = userModelObj.name
        emailIdLabel.text = userModelObj.email
        statusLabel.text = userModelObj.status
    }
    
}

extension UserDetailsTableCell: ConfigurableTableCell {
    
    func setConfiguration(_ userModel: UserModel?) {
        self.userModel = userModel
    }
}
