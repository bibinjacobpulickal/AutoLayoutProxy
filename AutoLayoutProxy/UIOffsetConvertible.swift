//
//  UIOffsetConvertible.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 01/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public protocol UIOffsetConvertible {

    var uiOffsetValue: UIOffset { get }
}

extension UIOffset: UIOffsetConvertible {

    public var uiOffsetValue: UIOffset {
        return self
    }
}

extension CGFloat: UIOffsetConvertible {

    public var uiOffsetValue: UIOffset {
        return UIOffset(self)
    }
}

extension Int: UIOffsetConvertible {

    public var uiOffsetValue: UIOffset {
        return UIOffset(CGFloat(self))
    }
}
