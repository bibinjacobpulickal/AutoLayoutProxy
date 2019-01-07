//
//  UIViewExtension.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 29/10/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

public func create<T>(_ setup: ((T) -> Void)) -> T where T: NSObject {
    let object = T()
    setup(object)
    return object
}

public extension UIView {
    
    public func addSubview(_ view: UIView, layout: (LayoutProxy) -> Void) {
        addSubview(view)
        layoutView(view, using: layout)
    }
    
    public func layoutView(_ view: UIView, using closure: (LayoutProxy) -> Void) {
        view.translatesAutoresizingMaskIntoConstraints = false
        closure(LayoutProxy(view: view, superView: self))
    }
    
    public func addSubview(_ view: UIView, edges: [UIRectEdge] = [], top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, padding: UIEdgeInsets = .zero, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil, size: CGSize = .zero) {
        
        addSubview(view, layout: {
            if edges.contains(.top) || top != nil {
                $0.top == (top ?? topAnchor) + padding.top
            }
            if edges.contains(.left) || left != nil {
                $0.left == (left ?? leftAnchor) + padding.left
            }
            if edges.contains(.leading) || leading != nil {
                $0.leading == (leading ?? leadingAnchor) + padding.leading
            }
            if edges.contains(.bottom) || bottom != nil {
                $0.bottom == (bottom ?? bottomAnchor) + padding.bottom
            }
            if edges.contains(.right) || right != nil {
                $0.right == (right ?? rightAnchor) + padding.right
            }
            if edges.contains(.trailing) || trailing != nil {
                $0.trailing == (trailing ?? trailingAnchor) + padding.trailing
            }
            if edges.contains(.centerX) || centerX != nil {
                $0.centerX == (centerX ?? centerXAnchor) + padding.centerX
            }
            if edges.contains(.centerY) || centerY != nil {
                $0.centerY == (centerY ?? centerYAnchor) + padding.centerY
            }
            if size != .zero {
                $0.size == size
            }
        })
    }
}
