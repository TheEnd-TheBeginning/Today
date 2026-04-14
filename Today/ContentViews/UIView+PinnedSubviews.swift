//
//  UIView+PinnedSubviews.swift
//  Today
//
//  Created by Александра Савичева on 13.04.2026.
//

import UIKit

extension UIView {
    func addPinnedSubview(_ subview: UIView,
                          height: CGFloat? = nil,
                          insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        subview.topAnchor.constraint(equalTo: topAnchor, constant: insets.top).isActive = true
        subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left).isActive = true
        subview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insets.right).isActive = true
        subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insets.bottom).isActive = true
        
        // Because the subview is pinned to the top and bottom of the superview,
        // adjusting the height of the subview forces the superview to also adjust its height.
        if let height {
            subview.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
