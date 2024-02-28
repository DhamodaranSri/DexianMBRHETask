//
//  AppDelegate.swift
//  DexianMBRHETask
//
//  Created by OrganicFarmers on 27/02/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

}

extension AppDelegate
{
    static var shared: AppDelegate? {
        UIApplication.shared.delegate as? AppDelegate
    }
}
