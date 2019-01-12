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
    
    public func add(_ view: UIView, attributes: [NSLayoutConstraint.Attribute], top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, padding: UIEdgeInsets = .zero, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil, size: CGSize = .zero) {
        
        addSubview(view, layout: {
            if attributes.contains(.top) || top != nil {
                $0.top == (top ?? topAnchor) + padding.top
            }
            if attributes.contains(.left) || left != nil {
                $0.left == (left ?? leftAnchor) + padding.left
            }
            if attributes.contains(.leading) || leading != nil {
                $0.leading == (leading ?? leadingAnchor) + padding.leading
            }
            if attributes.contains(.bottom) || bottom != nil {
                $0.bottom == (bottom ?? bottomAnchor) + padding.bottom
            }
            if attributes.contains(.right) || right != nil {
                $0.right == (right ?? rightAnchor) + padding.right
            }
            if attributes.contains(.trailing) || trailing != nil {
                $0.trailing == (trailing ?? trailingAnchor) + padding.trailing
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
