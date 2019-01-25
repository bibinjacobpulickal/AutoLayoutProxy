//
//  UIViewExtension.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 29/10/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

public extension UIView {
    
    public func addSubview(_ view: UIView, layout: (LayoutProxy) -> Void) {
        addSubview(view)
        layoutView(view, using: layout)
    }
    
    public func layoutView(_ view: UIView, using closure: (LayoutProxy) -> Void) {
        view.translatesAutoresizingMaskIntoConstraints = false
        closure(LayoutProxy(view: view, superView: self))
    }
    
    public func addSubview(_ view: UIView, attributes: Set<NSLayoutConstraint.Attribute>, top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        addSubview(view, layout: {
            if attributes.contains(.top) || top != nil {
                $0.top == (top ?? topAnchor) + padding.top
            }
            if attributes.contains(.leading) || left != nil {
                $0.leading == (left ?? leadingAnchor) + padding.left
            }
            if attributes.contains(.bottom) || bottom != nil {
                $0.bottom == (bottom ?? bottomAnchor) + padding.bottom
            }
            if attributes.contains(.trailing) || right != nil {
                $0.trailing == (right ?? trailingAnchor) + padding.right
            }
            if attributes.contains(.centerX) || centerX != nil {
                $0.centerX == (centerX ?? centerXAnchor) + padding.centerX
            }
            if attributes.contains(.centerY) || centerY != nil {
                $0.centerY == (centerY ?? centerYAnchor) + padding.centerY
            }
            if size != .zero {
                $0.size == size
            }
        })
    }
}
