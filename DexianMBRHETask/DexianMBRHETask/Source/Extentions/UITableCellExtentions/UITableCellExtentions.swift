//
//  UITableCellExtentions.swift
//  DexianMBRHETask
//
//  Created by OrganicFarmers on 27/02/24.
//

import UIKit

public protocol ConfigurableTableCell: UITableViewCell {
    associatedtype Configuration
    func setConfiguration(_ configuration: Configuration)
}

extension UITableView {

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Table View Cell")
        }

        return cell
    }
    
    func registerCell(type: UITableViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: identifier ?? cellId)
    }

}
