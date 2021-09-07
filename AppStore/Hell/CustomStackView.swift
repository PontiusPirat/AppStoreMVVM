//
//  VerticalStackView.swift
//  AppStore
//
//  Created by Pontius Pirat on 25.08.2021.
//

import UIKit

class CustomStackView: UIStackView {

    init(arrangedSubviews: [UIView], spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill,
         axis: NSLayoutConstraint.Axis = .vertical, distribution: UIStackView.Distribution = .fill) {
        
        super.init(frame: .zero)
        
        arrangedSubviews.forEach({addArrangedSubview($0)})
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.axis = axis
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
