//
//  BBMultiplierConvertible.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 01/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

#if canImport(CoreGraphics)
import CoreGraphics
#endif

public protocol BBMultiplierConvertible {

    var multiplierValue: BBMultiplier { get }
}

extension BBMultiplier: BBMultiplierConvertible {

    public var multiplierValue: BBMultiplier { self }
}

extension CGFloat: BBMultiplierConvertible {

    public var multiplierValue: BBMultiplier { BBMultiplier(self) }
}

extension Double: BBMultiplierConvertible {

    public var multiplierValue: BBMultiplier { BBMultiplier(CGFloat(self)) }
}

extension Int: BBMultiplierConvertible {

    public var multiplierValue: BBMultiplier { BBMultiplier(CGFloat(self)) }
}
