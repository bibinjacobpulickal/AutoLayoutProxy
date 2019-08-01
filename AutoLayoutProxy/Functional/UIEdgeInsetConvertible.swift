//
//  UIEdgeInsetConvertible.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 01/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public protocol UIEdgeInsetConvertible {

    var uiEdgeInsetValue: UIEdgeInsets { get }
}

extension UIEdgeInsets: UIEdgeInsetConvertible {

    public var uiEdgeInsetValue: UIEdgeInsets {
        return self
    }
}

extension CGFloat: UIEdgeInsetConvertible {

    public var uiEdgeInsetValue: UIEdgeInsets {
        return UIEdgeInsets(self)
    }
}

extension Int: UIEdgeInsetConvertible {

    public var uiEdgeInsetValue: UIEdgeInsets {
        return UIEdgeInsets(CGFloat(self))
    }
}
