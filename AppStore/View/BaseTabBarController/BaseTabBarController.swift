//
//  BaseTabBarController.swift
//  AppStore
//
//  Created by Pontius Pirat on 20.08.2021.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .black
        //tabBar.backgroundColor = .systemGray6
        
        viewControllers = [
            createNavController(viewController: UIViewController(), imageName: "doc.text.image", color: .white, title: "Today"),
            createNavController(viewController: UIViewController(), imageName: "square.stack.3d.up.fill", color: .white, title: "Apps"),
            createNavController(viewController: AppSearchController(), imageName: "magnifyingglass", color: .white, title: "Search")
        ]
        
    }
    
}
