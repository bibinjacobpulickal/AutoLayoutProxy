//
//  CGSizeConvertible.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 01/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public protocol CGSizeConvertible {
    var cgSizeValue: CGSize { get }
}

extension CGSize: CGSizeConvertible {

    public var cgSizeValue: CGSize {
        return self
    }
}

extension CGFloat: CGSizeConvertible {

    public var cgSizeValue: CGSize {
        return CGSize(self)
    }
}

extension Int: CGSizeConvertible {

    public var cgSizeValue: CGSize {
        return CGSize(CGFloat(self))
    }
}
