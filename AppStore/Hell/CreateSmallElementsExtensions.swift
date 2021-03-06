//
//  CreateSmallElementsExtensions.swift
//  AppStore
//
//  Created by Pontius Pirat on 25.08.2021.
//

import UIKit
import Combine

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

// MARK: - Small elements

// Label
extension UILabel {
    convenience init(text: String, font: UIFont, numberOfLines: Int = 1) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
}

// ImageView
extension UIImageView {
    convenience init(backgroundcolor: UIColor = .blue, widthAnchor: CGFloat = 0,
                     heightAnchor: CGFloat = 250, cornerRadius: CGFloat = 0, borderWidth: CGFloat = 0,
                     borderColor: CGColor = UIColor(white: 0, alpha: 0).cgColor, contentMode: UIView.ContentMode = .scaleAspectFill) {
        
        self.init(image: nil)
        self.widthAnchor.constraint(equalToConstant: widthAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: heightAnchor).isActive = true
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.contentMode = contentMode
    }
}

// Button
extension UIButton {
    convenience init(title: String, titleColor: UIColor, font: UIFont, backgroundcolor: UIColor,
                     cornerRadius: CGFloat, widthAnchor: CGFloat, heightAnchor: CGFloat) {
        
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        self.backgroundColor = backgroundcolor
        self.layer.cornerRadius = cornerRadius
        self.widthAnchor.constraint(equalToConstant: widthAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: heightAnchor).isActive = true
    }
}

extension UISearchTextField {
    var textPublisher: AnyPublisher<String, Never> {
            NotificationCenter.default
                .publisher(for: UISearchTextField.textDidChangeNotification, object: self)
                .compactMap { $0.object as? UISearchTextField } // receiving notifications with objects which are instances of UITextFields
                .compactMap(\.text) // extracting text and removing optional values (even though the text cannot be nil)
                .eraseToAnyPublisher()
        }
}
