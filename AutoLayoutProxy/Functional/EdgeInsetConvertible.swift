//
//  EdgeInsetConvertible.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 01/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public protocol EdgeInsetConvertible {

    var edgeInsetValue: UIEdgeInsets { get }
}

extension UIEdgeInsets: EdgeInsetConvertible {

    public var edgeInsetValue: UIEdgeInsets {
        return self
    }
}

extension CGFloat: EdgeInsetConvertible {

    public var edgeInsetValue: UIEdgeInsets {
        return UIEdgeInsets(self)
    }
}

extension Int: EdgeInsetConvertible {

    public var edgeInsetValue: UIEdgeInsets {
        return UIEdgeInsets(CGFloat(self))
    }
}
