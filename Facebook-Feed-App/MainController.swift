//
//  MainController.swift
//  Facebook-Feed-App
//
//  Created by Cecilia Andrea Pesce on 05/06/22.
//

import Foundation
import UIKit

class MainController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

import SwiftUI
struct MainPreview: PreviewProvider {
    static var previews: some View {
//        Text("main preview")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> UIViewController {
            return MainController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
        }
}
}
