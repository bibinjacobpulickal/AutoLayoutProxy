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

extension UIView {
    
    public func addSubview(_ view: UIView,
                           anchors: Set<NSLayoutConstraint.Attribute>      = [],
                           top: NSLayoutYAxisAnchor?                       = nil,
                           topRelation: NSLayoutConstraint.Relation        = .equal,
                           left: NSLayoutXAxisAnchor?                      = nil,
                           leftRelation: NSLayoutConstraint.Relation       = .equal,
                           bottom: NSLayoutYAxisAnchor?                    = nil,
                           bottomRelation: NSLayoutConstraint.Relation     = .equal,
                           right: NSLayoutXAxisAnchor?                     = nil,
                           rightRelation: NSLayoutConstraint.Relation      = .equal,
                           padding: UIEdgeInsets                           = .zero,
                           centerX: NSLayoutXAxisAnchor?                   = nil,
                           centerXRelation: NSLayoutConstraint.Relation    = .equal,
                           centerY: NSLayoutYAxisAnchor?                   = nil,
                           centerYRelation: NSLayoutConstraint.Relation    = .equal,
                           offset: UIOffset                                = .zero,
                           width: NSLayoutDimension?                       = nil,
                           widthRelation: NSLayoutConstraint.Relation      = .equal,
                           height: NSLayoutDimension?                      = nil,
                           heightRelation: NSLayoutConstraint.Relation     = .equal,
                           size: CGSize                                    = .zero) {
        initialSetup(view)
        addSideAnchors(view,
                       anchors: anchors,
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
                         anchors: anchors,
                         centerX: centerX,
                         centerXRelation: centerXRelation,
                         centerY: centerY,
                         centerYRelation: centerYRelation,
                         offset: offset)
        addLayoutDimensions(view,
                            anchors: anchors,
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
                                anchors: Set<NSLayoutConstraint.Attribute>,
                                top: NSLayoutYAxisAnchor?,
                                topRelation: NSLayoutConstraint.Relation,
                                left: NSLayoutXAxisAnchor?,
                                leftRelation: NSLayoutConstraint.Relation,
                                bottom: NSLayoutYAxisAnchor?,
                                bottomRelation: NSLayoutConstraint.Relation,
                                right: NSLayoutXAxisAnchor?,
                                rightRelation: NSLayoutConstraint.Relation,
                                padding: UIEdgeInsets) {
        if anchors.contains(.top) || top != nil {
            addAnchor(lhs: view.topAnchor, relation: topRelation, rhs: top ?? topAnchor, padding: padding.top)
        }
        if anchors.contains(.leading) || anchors.contains(.left) || left != nil {
            addAnchor(lhs: view.leadingAnchor, relation: leftRelation, rhs: left ?? leadingAnchor, padding: padding.left)
        }
        if anchors.contains(.bottom) || bottom != nil {
            addAnchor(lhs: view.bottomAnchor, relation: bottomRelation, rhs: bottom ?? bottomAnchor, padding: padding.bottom)
        }
        if anchors.contains(.trailing) || anchors.contains(.right) || right != nil {
            addAnchor(lhs: view.trailingAnchor, relation: rightRelation, rhs: right ?? trailingAnchor, padding: padding.right)
        }
    }
    
    private func addCenterAnchors(_ view: UIView,
                                  anchors: Set<NSLayoutConstraint.Attribute>,
                                  centerX: NSLayoutXAxisAnchor?,
                                  centerXRelation: NSLayoutConstraint.Relation,
                                  centerY: NSLayoutYAxisAnchor?,
                                  centerYRelation: NSLayoutConstraint.Relation,
                                  offset: UIOffset) {
        if anchors.contains(.centerX) || centerX != nil {
            addAnchor(lhs: view.centerXAnchor, relation: centerXRelation, rhs: centerX ?? centerXAnchor, padding: offset.horizontal)
        }
        if anchors.contains(.centerY) || centerY != nil {
            addAnchor(lhs: view.centerYAnchor, relation: centerYRelation, rhs: centerY ?? centerYAnchor, padding: offset.vertical)
        }
    }
    
    private func addLayoutDimensions(_ view: UIView,
                                     anchors: Set<NSLayoutConstraint.Attribute>,
                                     width: NSLayoutDimension?,
                                     widthRelation: NSLayoutConstraint.Relation,
                                     height: NSLayoutDimension?,
                                     heightRelation: NSLayoutConstraint.Relation,
                                     padding: UIEdgeInsets,
                                     size: CGSize) {
        if anchors.contains(.width) {
            addAnchor(lhs: view.widthAnchor, relation: widthRelation, rhs: width ?? widthAnchor, padding: size.width)
        } else if size.width != 0 {
            addAnchor(lhs: view.widthAnchor, relation: widthRelation, rhs: size.width)
        }
        if anchors.contains(.height) {
            addAnchor(lhs: view.heightAnchor, relation: heightRelation, rhs: height ?? heightAnchor, padding: size.height)
        } else if size.height != 0 {
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
