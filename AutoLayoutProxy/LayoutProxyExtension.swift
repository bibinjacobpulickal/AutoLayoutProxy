//
//  LayoutProxyExtension.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 22/01/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

import Foundation

public extension LayoutProxy {

    func fillSuperView(padding: UIEdgeInsets = .zero) {
        fillView(superView, padding: padding)
    }

    func fillView(_ view: UIView, padding: UIEdgeInsets = .zero) {
        anchorAllExcept([], padding: padding, to: view)
    }

    func alignCentersToSuperView(padding: UIEdgeInsets = .zero) {
        alignCenters(padding: padding, to: superView)
    }

    func alignCenters(padding: UIEdgeInsets = .zero, to view: UIView) {
        addAnchors([.centerX, .centerY], padding: padding, to: view)
    }

    func anchorAllSidesExcept(
        _ exemptedSides: Set<NSLayoutConstraint.Attribute>,
        padding: UIEdgeInsets = .zero) {
        anchorAllSidesExcept(exemptedSides, padding: padding, to: superView)
    }

    func anchorAllSidesExcept(
        _ exemptedSides: Set<NSLayoutConstraint.Attribute>,
        padding: UIEdgeInsets = .zero,
        to view: UIView) {
        var attributes: Set<NSLayoutConstraint.Attribute> = [.top, .bottom, .leading, .trailing]
        attributes.subtract(exemptedSides)
        addAnchors(attributes, padding: padding, to: view)
    }

    func anchorAllExcept(
        _ exemptedAnchors: Set<NSLayoutConstraint.Attribute>,
        padding: UIEdgeInsets = .zero) {
        anchorAllExcept(exemptedAnchors, padding: padding, to: superView)
    }

    func anchorAllExcept(
        _ exemptedAnchors: Set<NSLayoutConstraint.Attribute>,
        padding: UIEdgeInsets = .zero,
        to view: UIView) {
        var attributes: Set<NSLayoutConstraint.Attribute> =
            [.top, .bottom, .leading, .trailing, .centerX, .centerY, .width, .height]
        attributes.subtract(exemptedAnchors)
        addAnchors(attributes, padding: padding, to: view)
    }

    func addAnchors(
        _ anchors: Set<NSLayoutConstraint.Attribute>,
        padding: UIEdgeInsets = .zero, offset: UIOffset = .zero) {
        addAnchors(anchors, padding: padding, offset: offset, to: superView)
    }

    func addAnchors(
        _ anchors: Set<NSLayoutConstraint.Attribute>,
        padding: UIEdgeInsets = .zero,
        offset: UIOffset = .zero,
        to view: UIView) {
        if anchors.contains(.top) {
            top == view.topAnchor + padding.top
        }
        if anchors.contains(.bottom) {
            bottom == view.bottomAnchor + padding.bottom
        }
        if anchors.contains(.leading) || anchors.contains(.left) {
            left == view.leadingAnchor + padding.left
        }
        if anchors.contains(.trailing) || anchors.contains(.right) {
            right == view.trailingAnchor + padding.right
        }
        if anchors.contains(.centerX) {
            centerX == view.centerXAnchor + offset.horizontal
        }
        if anchors.contains(.centerY) {
            centerY == view.centerYAnchor + offset.vertical
        }
        if anchors.contains(.width) {
            width == view.widthAnchor
        }
        if anchors.contains(.height) {
            height == view.heightAnchor
        }
    }
}
