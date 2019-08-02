//
//  LayoutProxyExtension.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 22/01/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public extension LayoutProxy {

    func fillSuperView(inset: UIEdgeInsetConvertible = 0) {
        fillView(superView, inset: inset)
    }

    func fillView(_ view: UIView, inset: UIEdgeInsetConvertible = 0) {
        anchorAllExcept([], inset: inset, to: view)
    }

    func alignCentersToSuperView(inset: UIEdgeInsetConvertible = 0) {
        alignCenters(inset: inset, to: superView)
    }

    func alignCenters(inset: UIEdgeInsetConvertible = 0, to view: UIView) {
        addAnchors([.centerX, .centerY], inset: inset, to: view)
    }

    func anchorAllSidesExcept(
        _ exemptedSides: Set<NSLayoutConstraint.Attribute>,
        inset: UIEdgeInsetConvertible = 0) {
        anchorAllSidesExcept(exemptedSides, inset: inset, to: superView)
    }

    func anchorAllSidesExcept(
        _ exemptedSides: Set<NSLayoutConstraint.Attribute>,
        inset: UIEdgeInsetConvertible = 0,
        to view: UIView) {
        var attributes: Set<NSLayoutConstraint.Attribute> = [.top, .bottom, .leading, .trailing]
        attributes.subtract(exemptedSides)
        addAnchors(attributes, inset: inset, to: view)
    }

    func anchorAllExcept(
        _ exemptedAnchors: Set<NSLayoutConstraint.Attribute>,
        inset: UIEdgeInsetConvertible = 0) {
        anchorAllExcept(exemptedAnchors, inset: inset, to: superView)
    }

    func anchorAllExcept(
        _ exemptedAnchors: Set<NSLayoutConstraint.Attribute>,
        inset: UIEdgeInsetConvertible = 0,
        to view: UIView) {
        var attributes: Set<NSLayoutConstraint.Attribute> =
            [.top, .bottom, .leading, .trailing, .centerX, .centerY, .width, .height]
        attributes.subtract(exemptedAnchors)
        addAnchors(attributes, inset: inset, to: view)
    }

    func addAnchors(
        _ anchors: Set<NSLayoutConstraint.Attribute>,
        inset: UIEdgeInsetConvertible = 0, offset: UIOffsetConvertible = 0) {
        addAnchors(anchors, inset: inset, offset: offset, to: superView)
    }

    func addAnchors(
        _ anchors: Set<NSLayoutConstraint.Attribute>,
        inset: UIEdgeInsetConvertible = 0,
        offset: UIOffsetConvertible = 0,
        to view: UIView) {
        if anchors.contains(.top) {
            top == view.topAnchor + inset.uiEdgeInsetValue.top
        }
        if anchors.contains(.bottom) {
            bottom == view.bottomAnchor + inset.uiEdgeInsetValue.bottom
        }
        if anchors.contains(.leading) || anchors.contains(.left) {
            left == view.leadingAnchor + inset.uiEdgeInsetValue.left
        }
        if anchors.contains(.trailing) || anchors.contains(.right) {
            right == view.trailingAnchor + inset.uiEdgeInsetValue.right
        }
        if anchors.contains(.centerX) {
            centerX == view.centerXAnchor + offset.uiOffsetValue.horizontal
        }
        if anchors.contains(.centerY) {
            centerY == view.centerYAnchor + offset.uiOffsetValue.vertical
        }
        if anchors.contains(.width) {
            width == view.widthAnchor
        }
        if anchors.contains(.height) {
            height == view.heightAnchor
        }
    }
}
