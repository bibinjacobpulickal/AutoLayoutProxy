//
//  LayoutProxyExtension.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 22/01/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public extension LayoutProxy {

    func fillSuperView(inset: EdgeInsetConvertible = 0) {
        fillView(superView, inset: inset)
    }

    func fillView<View: AutoLayoutable>(_ view: View, inset: EdgeInsetConvertible = 0) {
        anchorAllExcept([], inset: inset, to: view)
    }

    func alignCentersToSuperView(inset: EdgeInsetConvertible = 0) {
        alignCenters(inset: inset, to: superView)
    }

    func alignCenters<View: AutoLayoutable>(inset: EdgeInsetConvertible = 0, to view: View) {
        addAnchors([.centerX, .centerY], inset: inset, to: view)
    }

    func anchorAllSidesExcept(
        _ exemptedSides: Set<NSLayoutConstraint.Attribute>,
        inset: EdgeInsetConvertible = 0) {
        anchorAllSidesExcept(exemptedSides, inset: inset, to: superView)
    }

    func anchorAllSidesExcept<View: AutoLayoutable>(
        _ exemptedSides: Set<NSLayoutConstraint.Attribute>,
        inset: EdgeInsetConvertible = 0,
        to view: View) {
        var attributes: Set<NSLayoutConstraint.Attribute> = [.top, .bottom, .leading, .trailing]
        attributes.subtract(exemptedSides)
        addAnchors(attributes, inset: inset, to: view)
    }

    func anchorAllExcept(
        _ exemptedAnchors: Set<NSLayoutConstraint.Attribute>,
        inset: EdgeInsetConvertible = 0) {
        anchorAllExcept(exemptedAnchors, inset: inset, to: superView)
    }

    func anchorAllExcept<View: AutoLayoutable>(
        _ exemptedAnchors: Set<NSLayoutConstraint.Attribute>,
        inset: EdgeInsetConvertible = 0,
        to view: View) {
        var attributes: Set<NSLayoutConstraint.Attribute> =
            [.top, .bottom, .leading, .trailing, .centerX, .centerY, .width, .height]
        attributes.subtract(exemptedAnchors)
        addAnchors(attributes, inset: inset, to: view)
    }

    func addAnchors(
        _ anchors: Set<NSLayoutConstraint.Attribute>,
        inset: EdgeInsetConvertible = 0, offset: OffsetConvertible = 0) {
        addAnchors(anchors, inset: inset, offset: offset, to: superView)
    }

    func addAnchors<View: AutoLayoutable>(
        _ anchors: Set<NSLayoutConstraint.Attribute>,
        inset: EdgeInsetConvertible = 0,
        offset: OffsetConvertible = 0,
        to view: View) {
        if anchors.contains(.top) {
            top == view.topAnchor + inset.top
        }
        if anchors.contains(.bottom) {
            bottom == view.bottomAnchor + inset.bottom
        }
        if anchors.contains(.leading) || anchors.contains(.left) {
            left == view.leadingAnchor + inset.left
        }
        if anchors.contains(.trailing) || anchors.contains(.right) {
            right == view.trailingAnchor + inset.right
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
