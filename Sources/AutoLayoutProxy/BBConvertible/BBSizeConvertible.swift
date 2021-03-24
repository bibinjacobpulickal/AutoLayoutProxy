//
//  BBSizeConvertible.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 01/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

#if canImport(CoreGraphics)
import CoreGraphics
#endif

public protocol BBSizeConvertible {

    var width: CGFloat { get }

    var height: CGFloat { get }
}

extension CGSize: BBSizeConvertible { }

extension CGFloat: BBSizeConvertible {

    public var width: CGFloat { self }

    public var height: CGFloat { self }
}

extension Double: BBSizeConvertible {

    public var width: CGFloat { CGFloat(self) }

    public var height: CGFloat { CGFloat(self) }
}

extension Int: BBSizeConvertible {

    public var width: CGFloat { CGFloat(self) }

    public var height: CGFloat { CGFloat(self) }
}
