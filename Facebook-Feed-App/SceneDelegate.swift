//
//  SceneDelegate.swift
//  nosferatu
//
//  Created by Caporal on 02/06/22.
//

import UIKit
import SwiftUI

class FSSceneDelegate: UIResponder, UIWindowSceneDelegate {
  
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowsScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowsScene)
            //window.rootViewController = MainVC()
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}
