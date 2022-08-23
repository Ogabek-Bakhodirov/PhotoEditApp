//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit
import SnapKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Override point for customization after application launch.

        window = UIWindow()
        window?.rootViewController = SignUpViewController()
        window?.makeKeyAndVisible()

        return true
    }
}
