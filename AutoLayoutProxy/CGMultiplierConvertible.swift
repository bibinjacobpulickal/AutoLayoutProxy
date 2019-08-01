//
//  CGMultiplierConvertible.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 01/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public protocol CGMultiplierConvertible {

    var cgMultiplierValue: CGMultiplier { get }
}

extension CGMultiplier: CGMultiplierConvertible {

    public var cgMultiplierValue: CGMultiplier {
        return self
    }
}

extension CGFloat: CGMultiplierConvertible {

    public var cgMultiplierValue: CGMultiplier {
        return CGMultiplier(self)
    }
}

extension Int: CGMultiplierConvertible {

    public var cgMultiplierValue: CGMultiplier {
        return CGMultiplier(CGFloat(self))
    }
}
