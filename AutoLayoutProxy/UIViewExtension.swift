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
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(view)
        
        if edges.contains(.top) || top != nil {
            view.topAnchor.constraint(equalTo: top ?? topAnchor, constant: padding.top).isActive = true
        }
        
        if edges.contains(.left) || left != nil {
            view.leftAnchor.constraint(equalTo: left ?? leftAnchor, constant: padding.left).isActive = true
        }
        
        if edges.contains(.leading) || leading != nil {
            view.leadingAnchor.constraint(equalTo: leading ?? leadingAnchor, constant: padding.leading).isActive = true
        }
        
        if edges.contains(.bottom) || bottom != nil {
            view.bottomAnchor.constraint(equalTo: bottom ?? bottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if edges.contains(.right) || right != nil {
            view.rightAnchor.constraint(equalTo: right ?? rightAnchor, constant: -padding.right).isActive = true
        }
        
        if edges.contains(.trailing) || trailing != nil {
            view.trailingAnchor.constraint(equalTo: trailing ?? trailingAnchor, constant: -padding.trailing).isActive = true
        }
        
        if edges.contains(.centerX) || centerX != nil {
            view.centerXAnchor.constraint(equalTo: centerX ?? centerXAnchor, constant: padding.centerX).isActive = true
        }
        
        if edges.contains(.centerY) || centerY != nil {
            view.centerYAnchor.constraint(equalTo: centerY ?? centerYAnchor, constant: padding.centerY).isActive = true
        }
    }
}
