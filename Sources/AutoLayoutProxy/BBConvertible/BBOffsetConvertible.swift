//
//  OffsetConvertible.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 01/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

#if canImport(CoreGraphics)
import CoreGraphics
#endif

public protocol BBOffsetConvertible {

    var horizontal: CGFloat { get }

    var vertical: CGFloat { get }
}

#if canImport(UIKit)
import UIKit

extension UIOffset: BBOffsetConvertible { }

#elseif canImport(Cocoa)
import Cocoa

extension BBOffset: BBOffsetConvertible { }

#endif

extension CGFloat: BBOffsetConvertible {

    public var horizontal: CGFloat { self }

    public var vertical: CGFloat { self }
}

extension Double: BBOffsetConvertible {

    public var horizontal: CGFloat { CGFloat(self) }

    public var vertical: CGFloat { CGFloat(self) }
}

extension Int: BBOffsetConvertible {

    public var horizontal: CGFloat { CGFloat(self) }

    public var vertical: CGFloat { CGFloat(self) }
}
