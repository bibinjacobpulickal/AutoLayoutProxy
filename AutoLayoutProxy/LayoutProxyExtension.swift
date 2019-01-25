//
//  LayoutProxyExtension.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 22/01/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

import Foundation

public extension LayoutProxy {
    
    public func fillSuperView(padding: UIEdgeInsets = .zero) {
        fillView(superView, padding: padding)
    }
    
    public func fillView(_ view: UIView, padding: UIEdgeInsets = .zero) {
        anchorAllAttributesExcept([], padding: padding, to: view)
    }
    
    public func alignCentersToSuperView(padding: UIEdgeInsets = .zero) {
        alignCenters(padding: padding, to: superView)
    }
    
    public func alignCenters(padding: UIEdgeInsets = .zero, to view: UIView) {
        anchorAttributes([.centerX, .centerY], padding: padding, to: view)
    }
    
    public func anchorAllSidesExcept(_ exemptedSides: Set<NSLayoutConstraint.Attribute>, padding: UIEdgeInsets = .zero) {
        anchorAllSidesExcept(exemptedSides, padding: padding, to: superView)
    }
    
    public func anchorAllSidesExcept(_ exemptedSides: Set<NSLayoutConstraint.Attribute>, padding: UIEdgeInsets = .zero, to view: UIView) {
        var attributes: Set<NSLayoutConstraint.Attribute> = [.top, .bottom, .leading, .trailing]
        attributes.subtract(exemptedSides)
        anchorAttributes(attributes, padding: padding, to: view)
    }
    
    public func anchorAllAttributesExcept(_ exemptedAttributes: Set<NSLayoutConstraint.Attribute>, padding: UIEdgeInsets = .zero) {
        anchorAllAttributesExcept(exemptedAttributes, padding: padding, to: superView)
    }
    
    public func anchorAllAttributesExcept(_ exemptedAttributes: Set<NSLayoutConstraint.Attribute>, padding: UIEdgeInsets = .zero, to view: UIView) {
        var attributes: Set<NSLayoutConstraint.Attribute> = [.top, .bottom, .leading, .trailing, .centerX, .centerY, .width, .height]
        attributes.subtract(exemptedAttributes)
        anchorAttributes(attributes, padding: padding, to: view)
    }
    
    public func anchorAttributes(_ attributes: Set<NSLayoutConstraint.Attribute>, padding: UIEdgeInsets = .zero) {
        anchorAttributes(attributes, padding: padding, to: superView)
    }
    
    public func anchorAttributes(_ attributes: Set<NSLayoutConstraint.Attribute>, padding: UIEdgeInsets = .zero, to view: UIView) {
        if attributes.contains(.top) {
            top == view.topAnchor + padding.top
        }
        if attributes.contains(.bottom) {
            bottom == view.bottomAnchor + padding.bottom
        }
        if attributes.contains(.leading) || attributes.contains(.left) {
            leading == view.leadingAnchor + padding.left
        }
        if attributes.contains(.trailing) || attributes.contains(.right) {
            trailing == view.trailingAnchor + padding.right
        }
        if attributes.contains(.centerX) {
            centerX == view.centerXAnchor + padding.centerX
        }
        if attributes.contains(.centerY) {
            centerY == view.centerYAnchor + padding.centerY
        }
        if attributes.contains(.width) {
            width == view.widthAnchor
        }
        if attributes.contains(.height) {
            height == view.heightAnchor
        }
    }
}
