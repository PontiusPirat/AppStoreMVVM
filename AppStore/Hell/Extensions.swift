//
//  Extensions.swift
//  AppStore
//
//  Created by Pontius Pirat on 22.08.2021.
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
    func createAppIconImage(appIconImage: UIImageView,
                            backgroundcolor: UIColor,
                            widthAnchor: CGFloat,
                            heightAnchor: CGFloat,
                            cornerRadius: CGFloat) -> UIImageView {
        
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
    func createButton(button: UIButton,
                      title: String,
                      titleColor: UIColor,
                      fontSize: CGFloat,
                      backgroundcolor: UIColor,
                      cornerRadius: CGFloat,
                      widthAnchor: CGFloat,
                      heightAnchor: CGFloat) -> UIButton {
        
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: fontSize)
        button.backgroundColor = backgroundcolor //(5)
        button.layer.cornerRadius = cornerRadius
        button.widthAnchor.constraint(equalToConstant: widthAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: heightAnchor).isActive = true
        return button
        
    }
}

// MARK: - Anchor 
// Reference Video: https://youtu.be/iqpAP7s3b-8
extension UIView {
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach{ $0?.isActive = true }
        
        return anchoredConstraints
    }
    
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func centerXInSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superViewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superViewCenterXAnchor).isActive = true
        }
    }
    
    func centerYInSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let centerY = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
    }
    
    func constrainWidth(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func constrainHeight(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
}

struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

