//
//  AppDelegate.swift
//  StarWars
//
//  Created by Angie Mugo on 10/08/2021.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
              window = UIWindow(frame: UIScreen.main.bounds)
              window?.backgroundColor = .white
              let coordinator = HomeCoordinator(window!)
              coordinator.start()
              window?.makeKeyAndVisible()
              return true
    }
}
