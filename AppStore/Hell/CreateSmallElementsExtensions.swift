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
    func createImage(backgroundcolor: UIColor = .blue, widthAnchor: CGFloat = 0,
                     heightAnchor: CGFloat = 250, cornerRadius: CGFloat = 0, borderWidth: CGFloat = 0,
                     borderColor: CGColor = UIColor(white: 0, alpha: 0).cgColor, contentMode: UIView.ContentMode = .scaleAspectFill) -> UIImageView {
        
        let imageView = UIImageView()
        //imageView.backgroundColor = backgroundcolor
        imageView.widthAnchor.constraint(equalToConstant: widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: heightAnchor).isActive = true
        imageView.layer.cornerRadius = cornerRadius
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = borderWidth
        imageView.layer.borderColor = borderColor
        imageView.contentMode = contentMode
        return imageView
    }
    
    // Label
    func createAnyLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        return label
    }
    
    // Button
    func createButton(title: String, titleColor: UIColor, fontSize: CGFloat, backgroundcolor: UIColor,
                      cornerRadius: CGFloat, widthAnchor: CGFloat, heightAnchor: CGFloat) -> UIButton {
        
        let button = UIButton()
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

