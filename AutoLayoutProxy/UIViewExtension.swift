//
//  UIViewExtension.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 29/10/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

public extension UIView {
    
    func addSubview(_ view: UIView, layout: (LayoutProxy) -> Void) {
        addSubview(view)
        layoutView(view, using: layout)
    }
    
    func layoutView(_ view: UIView, using closure: (LayoutProxy) -> Void) {
        view.translatesAutoresizingMaskIntoConstraints = false
        closure(LayoutProxy(view: view, superView: self))
    }
}

public extension UIView {
    
    func addSubview(_ view: UIView,
                    attributes: Set<NSLayoutConstraint.Attribute>   = [],
                    top: NSLayoutYAxisAnchor?                       = nil,
                    topRelation: NSLayoutConstraint.Relation        = .equal,
                    left: NSLayoutXAxisAnchor?                      = nil,
                    leftRelation: NSLayoutConstraint.Relation       = .equal,
                    bottom: NSLayoutYAxisAnchor?                    = nil,
                    bottomRelation: NSLayoutConstraint.Relation     = .equal,
                    right: NSLayoutXAxisAnchor?                     = nil,
                    rightRelation: NSLayoutConstraint.Relation      = .equal,
                    centerX: NSLayoutXAxisAnchor?                   = nil,
                    centerXRelation: NSLayoutConstraint.Relation    = .equal,
                    centerY: NSLayoutYAxisAnchor?                   = nil,
                    centerYRelation: NSLayoutConstraint.Relation    = .equal,
                    padding: UIEdgeInsets                           = .zero,
                    width: NSLayoutDimension?                       = nil,
                    widthRelation: NSLayoutConstraint.Relation      = .equal,
                    height: NSLayoutDimension?                      = nil,
                    heightRelation: NSLayoutConstraint.Relation     = .equal,
                    size: CGSize                                    = .zero) {
        initialSetup(view)
        addSideAnchors(view,
                       attributes: attributes,
                       top: top,
                       topRelation: topRelation,
                       left: left,
                       leftRelation: leftRelation,
                       bottom: bottom,
                       bottomRelation: bottomRelation,
                       right: right,
                       rightRelation: rightRelation,
                       padding: padding)
        addCenterAnchors(view,
                         attributes: attributes,
                         centerX: centerX,
                         centerXRelation: centerXRelation,
                         centerY: centerY,
                         centerYRelation: centerYRelation,
                         padding: padding)
        addLayoutDimensions(view,
                            attributes: attributes,
                            width: width,
                            widthRelation: widthRelation,
                            height: height,
                            heightRelation: heightRelation,
                            padding: padding,
                            size: size)
    }
    
    private func initialSetup(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    
    private func addSideAnchors(_ view: UIView,
                                attributes: Set<NSLayoutConstraint.Attribute>,
                                top: NSLayoutYAxisAnchor?,
                                topRelation: NSLayoutConstraint.Relation,
                                left: NSLayoutXAxisAnchor?,
                                leftRelation: NSLayoutConstraint.Relation,
                                bottom: NSLayoutYAxisAnchor?,
                                bottomRelation: NSLayoutConstraint.Relation,
                                right: NSLayoutXAxisAnchor?,
                                rightRelation: NSLayoutConstraint.Relation,
                                padding: UIEdgeInsets) {
        if attributes.contains(.top) || top != nil {
            addAnchor(lhs: view.topAnchor, relation: topRelation, rhs: top ?? topAnchor, padding: padding.top)
        }
        if attributes.contains(.leading) || attributes.contains(.left) || left != nil {
            addAnchor(lhs: view.leadingAnchor, relation: leftRelation, rhs: left ?? leadingAnchor, padding: padding.left)
        }
        if attributes.contains(.bottom) || bottom != nil {
            addAnchor(lhs: view.bottomAnchor, relation: bottomRelation, rhs: bottom ?? bottomAnchor, padding: padding.bottom)
        }
        if attributes.contains(.trailing) || attributes.contains(.right) || right != nil {
            addAnchor(lhs: view.trailingAnchor, relation: rightRelation, rhs: right ?? trailingAnchor, padding: padding.right)
        }
        if attributes.contains(.right) || right != nil {
            addAnchor(lhs: view.rightAnchor, relation: rightRelation, rhs: right ?? rightAnchor, padding: padding.right)
        }
    }
    
    private func addCenterAnchors(_ view: UIView,
                                  attributes: Set<NSLayoutConstraint.Attribute>,
                                  centerX: NSLayoutXAxisAnchor?,
                                  centerXRelation: NSLayoutConstraint.Relation,
                                  centerY: NSLayoutYAxisAnchor?,
                                  centerYRelation: NSLayoutConstraint.Relation,
                                  padding: UIEdgeInsets) {
        if attributes.contains(.centerX) || centerX != nil {
            addAnchor(lhs: view.centerXAnchor, relation: centerXRelation, rhs: centerX ?? centerXAnchor, padding: padding.centerX)
        }
        if attributes.contains(.centerY) || centerY != nil {
            addAnchor(lhs: view.centerYAnchor, relation: centerYRelation, rhs: centerY ?? centerYAnchor, padding: padding.centerY)
        }
    }
    
    private func addLayoutDimensions(_ view: UIView,
                                     attributes: Set<NSLayoutConstraint.Attribute>,
                                     width: NSLayoutDimension?,
                                     widthRelation: NSLayoutConstraint.Relation,
                                     height: NSLayoutDimension?,
                                     heightRelation: NSLayoutConstraint.Relation,
                                     padding: UIEdgeInsets,
                                     size: CGSize) {
        if attributes.contains(.width) {
            addAnchor(lhs: view.widthAnchor, relation: widthRelation, rhs: width ?? widthAnchor, padding: size.width)
        }
        if attributes.contains(.height) {
            addAnchor(lhs: view.heightAnchor, relation: heightRelation, rhs: height ?? heightAnchor, padding: size.height)
        }
        if size.width != 0 {
            addAnchor(lhs: view.widthAnchor, relation: widthRelation, rhs: size.width)
        }
        if size.height != 0 {
            addAnchor(lhs: view.heightAnchor, relation: heightRelation, rhs: size.height)
        }
    }
    
    private func addAnchor<Axis>(lhs: NSLayoutAnchor<Axis>, relation: NSLayoutConstraint.Relation, rhs: NSLayoutAnchor<Axis>, padding: CGFloat) {
        switch relation {
        case .lessThanOrEqual:
            lhs.constraint(lessThanOrEqualTo: rhs, constant: padding).isActive = true
        case .greaterThanOrEqual:
            lhs.constraint(greaterThanOrEqualTo: rhs, constant: padding).isActive = true
        default:
            lhs.constraint(equalTo: rhs, constant: padding).isActive = true
        }
    }
    
    private func addAnchor(lhs: NSLayoutDimension, relation: NSLayoutConstraint.Relation, rhs: CGFloat) {
        switch relation {
        case .lessThanOrEqual:
            lhs.constraint(lessThanOrEqualToConstant: rhs).isActive = true
        case .greaterThanOrEqual:
            lhs.constraint(greaterThanOrEqualToConstant: rhs).isActive = true
        default:
            lhs.constraint(equalToConstant: rhs).isActive = true
        }
    }
}
