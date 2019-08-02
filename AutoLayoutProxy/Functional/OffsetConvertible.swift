//
//  OffsetConvertible.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 01/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public protocol OffsetConvertible {

    var offsetValue: UIOffset { get }
}

extension UIOffset: OffsetConvertible {

    public var offsetValue: UIOffset {
        return self
    }
}

extension CGFloat: OffsetConvertible {

    public var offsetValue: UIOffset {
        return UIOffset(self)
    }
}

extension Int: OffsetConvertible {

    public var offsetValue: UIOffset {
        return UIOffset(CGFloat(self))
    }
}
