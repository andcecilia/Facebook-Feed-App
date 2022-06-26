import UIKit
import SwiftUI

class FSSceneDelegate: UIResponder, UIWindowSceneDelegate {
  
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowsScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowsScene)
            //window.rootViewController = MainController()
            window.rootViewController = UINavigationController(rootViewController: MainController())
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}
