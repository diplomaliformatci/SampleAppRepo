//
//  SceneDelegate.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 24.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard
            let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController =  UINavigationController(rootViewController: ProductsViewBuilder.make())
        window?.makeKeyAndVisible()
    }
}

