//
//  BBAutoLayoutableHelpers.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 29/10/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

#if canImport(UIKit)
import UIKit.NSLayoutAnchor
#elseif canImport(AppKit)
import AppKit.NSLayoutAnchor
#endif

public extension BBAutoLayoutable {

    func addSubview(
        _ view: View,
        anchors: Set<NSLayoutConstraint.Attribute>    = [],
        top: NSLayoutYAxisAnchor?                     = nil,
        topRelation: NSLayoutConstraint.Relation      = .equal,
        left: NSLayoutXAxisAnchor?                    = nil,
        leftRelation: NSLayoutConstraint.Relation     = .equal,
        leading: NSLayoutXAxisAnchor?                 = nil,
        leadingRelation: NSLayoutConstraint.Relation  = .equal,
        bottom: NSLayoutYAxisAnchor?                  = nil,
        bottomRelation: NSLayoutConstraint.Relation   = .equal,
        right: NSLayoutXAxisAnchor?                   = nil,
        rightRelation: NSLayoutConstraint.Relation    = .equal,
        trailing: NSLayoutXAxisAnchor?                = nil,
        trailingRelation: NSLayoutConstraint.Relation = .equal,
        inset: BBEdgeInsetConvertible                 = 0,
        centerX: NSLayoutXAxisAnchor?                 = nil,
        centerXRelation: NSLayoutConstraint.Relation  = .equal,
        centerY: NSLayoutYAxisAnchor?                 = nil,
        centerYRelation: NSLayoutConstraint.Relation  = .equal,
        offset: BBOffsetConvertible                   = 0,
        width: NSLayoutDimension?                     = nil,
        widthRelation: NSLayoutConstraint.Relation    = .equal,
        height: NSLayoutDimension?                    = nil,
        heightRelation: NSLayoutConstraint.Relation   = .equal,
        multiplier: BBMultiplierConvertible           = 1,
        size: BBSizeConvertible                       = 0) {

        addSubview(view)

        view.tamic()

        anchorView(
            view,
            anchors: anchors,
            top: top,
            topRelation: topRelation,
            left: left,
            leftRelation: leftRelation,
            leading: leading,
            leadingRelation: leadingRelation,
            bottom: bottom,
            bottomRelation: bottomRelation,
            right: right,
            rightRelation: rightRelation,
            trailing: trailing,
            trailingRelation: trailingRelation,
            inset: inset,
            centerX: centerX,
            centerXRelation: centerXRelation,
            centerY: centerY,
            centerYRelation: centerYRelation,
            offset: offset,
            width: width,
            widthRelation: widthRelation,
            height: height,
            heightRelation: heightRelation,
            multiplier: multiplier,
            size: size)
    }

    func anchor(
        _ anchors: Set<NSLayoutConstraint.Attribute>    = [],
        top: NSLayoutYAxisAnchor?                     = nil,
        topRelation: NSLayoutConstraint.Relation      = .equal,
        left: NSLayoutXAxisAnchor?                    = nil,
        leftRelation: NSLayoutConstraint.Relation     = .equal,
        leading: NSLayoutXAxisAnchor?                 = nil,
        leadingRelation: NSLayoutConstraint.Relation  = .equal,
        bottom: NSLayoutYAxisAnchor?                  = nil,
        bottomRelation: NSLayoutConstraint.Relation   = .equal,
        right: NSLayoutXAxisAnchor?                   = nil,
        rightRelation: NSLayoutConstraint.Relation    = .equal,
        trailing: NSLayoutXAxisAnchor?                = nil,
        trailingRelation: NSLayoutConstraint.Relation = .equal,
        inset: BBEdgeInsetConvertible                 = 0,
        centerX: NSLayoutXAxisAnchor?                 = nil,
        centerXRelation: NSLayoutConstraint.Relation  = .equal,
        centerY: NSLayoutYAxisAnchor?                 = nil,
        centerYRelation: NSLayoutConstraint.Relation  = .equal,
        offset: BBOffsetConvertible                   = 0,
        width: NSLayoutDimension?                     = nil,
        widthRelation: NSLayoutConstraint.Relation    = .equal,
        height: NSLayoutDimension?                    = nil,
        heightRelation: NSLayoutConstraint.Relation   = .equal,
        multiplier: BBMultiplierConvertible           = 1,
        size: BBSizeConvertible                       = 0) {

        guard let superview = superview else { return }

        tamic()

        superview.anchorView(
            self,
            anchors: anchors,
            top: top,
            topRelation: topRelation,
            left: left,
            leftRelation: leftRelation,
            leading: leading,
            leadingRelation: leadingRelation,
            bottom: bottom,
            bottomRelation: bottomRelation,
            right: right,
            rightRelation: rightRelation,
            trailing: trailing,
            trailingRelation: trailingRelation,
            inset: inset,
            centerX: centerX,
            centerXRelation: centerXRelation,
            centerY: centerY,
            centerYRelation: centerYRelation,
            offset: offset,
            width: width,
            widthRelation: widthRelation,
            height: height,
            heightRelation: heightRelation,
            multiplier: multiplier,
            size: size)
    }
}
