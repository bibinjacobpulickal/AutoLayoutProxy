//
//  AnchorableViewOperators.swift
//  
//
//  Created by Bibin Jacob Pulickal on 09/02/20.
//

#if canImport(UIKit)
import UIKit.NSLayoutAnchor
#elseif canImport(AppKit)
import AppKit.NSLayoutAnchor
#endif

@discardableResult public func ==<View: Anchorable>(lhs: View, rhs: View) -> [NSLayoutConstraint] {
    lhs.sides == rhs.sides
}

@discardableResult public func <=<View: Anchorable>(lhs: View, rhs: View) -> [NSLayoutConstraint] {
    lhs.sides <= rhs.sides
}

@discardableResult public func >=<View: Anchorable>(lhs: View, rhs: View) -> [NSLayoutConstraint] {
    lhs.sides >= rhs.sides
}

public func + <View: Anchorable>(lhs: View, rhs: EdgeInsetConvertible) -> (View, EdgeInsetConvertible) {
    (lhs, rhs)
}

public func - <View: Anchorable>(lhs: View, rhs: EdgeInsetConvertible) -> (View, EdgeInsetConvertible) {
    (lhs, rhs)
}

@discardableResult public func ==<View: Anchorable>(lhs: View, rhs: (View, EdgeInsetConvertible)) -> [NSLayoutConstraint] {
    lhs.sides == rhs.0.sides + rhs.1
}

@discardableResult public func <=<View: Anchorable>(lhs: View, rhs: (View, EdgeInsetConvertible)) -> [NSLayoutConstraint] {
    lhs.sides <= rhs.0.sides + rhs.1
}

@discardableResult public func >=<View: Anchorable>(lhs: View, rhs: (View, EdgeInsetConvertible)) -> [NSLayoutConstraint] {
    lhs.sides >= rhs.0.sides + rhs.1
}
