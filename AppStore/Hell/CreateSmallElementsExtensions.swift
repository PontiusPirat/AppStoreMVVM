//
//  CreateSmallElementsExtensions.swift
//  AppStore
//
//  Created by Pontius Pirat on 25.08.2021.
//

import UIKit

// MARK: - Small elements for BaseTabBarController

extension BaseTabBarController {
    
    func createNavController(viewController: UIViewController, imageName: String, color: UIColor, title: String) -> UINavigationController {
        
        let navViewController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = color
        viewController.title = title
        navViewController.tabBarItem.image = UIImage(systemName: imageName)
        navViewController.navigationBar.prefersLargeTitles = true
        //navViewController.navigationBar.backgroundColor = .blue
        
        return navViewController
        
    }
}

// MARK: - Small elements for SearchResultCell

extension SearchResultCell {
    
    // Icon image
    func createImage(appIconImage: UIImageView, backgroundcolor: UIColor = .blue, widthAnchor: CGFloat = 0,
                            heightAnchor: CGFloat = 250, cornerRadius: CGFloat = 0) -> UIImageView {
        
        appIconImage.backgroundColor = backgroundcolor
        appIconImage.widthAnchor.constraint(equalToConstant: widthAnchor).isActive = true
        appIconImage.heightAnchor.constraint(equalToConstant: heightAnchor).isActive = true
        appIconImage.layer.cornerRadius = cornerRadius
        return appIconImage
    }
    
    // Label
    func createAnyLabel(label: UILabel, text: String) -> UILabel {
        label.text = text
        return label
    }
    
    // Button
    func createButton(button: UIButton, title: String, titleColor: UIColor, fontSize: CGFloat, backgroundcolor: UIColor,
                      cornerRadius: CGFloat, widthAnchor: CGFloat, heightAnchor: CGFloat) -> UIButton {
        
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: fontSize)
        button.backgroundColor = backgroundcolor 
        button.layer.cornerRadius = cornerRadius
        button.widthAnchor.constraint(equalToConstant: widthAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: heightAnchor).isActive = true
        return button
    }
    
}

