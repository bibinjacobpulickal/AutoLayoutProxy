//
//  EdgeInsetConvertible.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 01/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public protocol EdgeInsetConvertible {

    var top: CGFloat { get }

    var left: CGFloat { get }

    var bottom: CGFloat { get }

    var right: CGFloat { get }
}

#if canImport(UIKit)

extension UIEdgeInsets: EdgeInsetConvertible { }

#elseif canImport(Cocoa)

extension NSEdgeInsets: EdgeInsetConvertible { }

#endif

extension CGFloat: EdgeInsetConvertible {

    public var top: CGFloat { self }

    public var left: CGFloat { self }

    public var bottom: CGFloat { -self }

    public var right: CGFloat { -self }
}

extension Double: EdgeInsetConvertible {

    public var top: CGFloat { CGFloat(self) }

    public var left: CGFloat { CGFloat(self) }

    public var bottom: CGFloat { -CGFloat(self) }

    public var right: CGFloat { -CGFloat(self) }
}

extension Int: EdgeInsetConvertible {

    public var top: CGFloat { CGFloat(self) }

    public var left: CGFloat { CGFloat(self) }

    public var bottom: CGFloat { -CGFloat(self) }

    public var right: CGFloat { -CGFloat(self) }
}
