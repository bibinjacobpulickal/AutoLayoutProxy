//
//  SizeConvertible.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 01/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public protocol SizeConvertible {
    var sizeValue: CGSize { get }
}

extension CGSize: SizeConvertible {

    public var sizeValue: CGSize {
        return self
    }
}

extension CGFloat: SizeConvertible {

    public var sizeValue: CGSize {
        return CGSize(self)
    }
}

extension Int: SizeConvertible {

    public var sizeValue: CGSize {
        return CGSize(CGFloat(self))
    }
}
