//
//  BBEdgeInsetConvertible.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 01/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

#if canImport(CoreGraphics)
import CoreGraphics
#endif

public protocol BBEdgeInsetConvertible {

    var top: CGFloat { get }

    var left: CGFloat { get }

    var bottom: CGFloat { get }

    var right: CGFloat { get }
}

#if canImport(UIKit)
import UIKit

extension UIEdgeInsets: BBEdgeInsetConvertible { }

#elseif canImport(Cocoa)
import Cocoa

extension NSEdgeInsets: BBEdgeInsetConvertible { }

#endif

extension CGFloat: BBEdgeInsetConvertible {

    public var top: CGFloat { self }

    public var left: CGFloat { self }

    public var bottom: CGFloat { self }

    public var right: CGFloat { self }
}

extension Double: BBEdgeInsetConvertible {

    public var top: CGFloat { CGFloat(self) }

    public var left: CGFloat { CGFloat(self) }

    public var bottom: CGFloat { CGFloat(self) }

    public var right: CGFloat { CGFloat(self) }
}

extension Int: BBEdgeInsetConvertible {

    public var top: CGFloat { CGFloat(self) }

    public var left: CGFloat { CGFloat(self) }

    public var bottom: CGFloat { CGFloat(self) }

    public var right: CGFloat { CGFloat(self) }
}
