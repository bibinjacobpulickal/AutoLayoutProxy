//
//  SizeConvertible.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 01/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public protocol SizeConvertible {

    var width: CGFloat { get }

    var height: CGFloat { get }
}

extension CGSize: SizeConvertible { }

extension CGFloat: SizeConvertible {

    public var width: CGFloat { self }

    public var height: CGFloat { self }
}

extension Double: SizeConvertible {

    public var width: CGFloat { CGFloat(self) }

    public var height: CGFloat { CGFloat(self) }
}

extension Int: SizeConvertible {

    public var width: CGFloat { CGFloat(self) }

    public var height: CGFloat { CGFloat(self) }
}
