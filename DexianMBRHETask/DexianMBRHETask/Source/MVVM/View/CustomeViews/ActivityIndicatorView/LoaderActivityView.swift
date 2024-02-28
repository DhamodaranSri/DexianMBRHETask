//
//  LoaderActivityView.swift
//  DexianMBRHETask
//
//  Created by OrganicFarmers on 28/02/24.
//

import Foundation
import UIKit

class ActivityAndAlert {

    static func showAlert(with message: String?) {
        CustomeAlertView(title: "Alert", message: message ?? "", preferredStyle: .alert)
            .showAlert()
    }
    
    static func showLoader() {
        LoaderActivityView(title: "", message: "Loader", preferredStyle: .alert)
            .showLoader()
    }
    
    static func dismissAlertOrLoaded() {
        AppDelegate.shared?.window?.rootViewController?.dismiss(animated: false)
    }
}

class LoaderActivityView: UIAlertController {
    
    override func viewDidLoad() {
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.startAnimating()
        self.view.addSubview(loadingIndicator)
    }

    func showLoader() {
        AppDelegate.shared?.window?.rootViewController?.present(self, animated: false)
    }

}


class CustomeAlertView: UIAlertController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addAction(UIAlertAction(title: "OK", style: .default))
    }

    func showAlert() {
        AppDelegate.shared?.window?.rootViewController?.present(self, animated: false)
    }
    
}
