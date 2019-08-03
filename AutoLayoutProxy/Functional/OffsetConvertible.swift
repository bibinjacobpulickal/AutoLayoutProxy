//
//  OffsetConvertible.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 01/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public protocol OffsetConvertible {

    var horizontal: CGFloat { get }

    var vertical: CGFloat { get }
}

extension UIOffset: OffsetConvertible { }

extension CGFloat: OffsetConvertible {

    public var horizontal: CGFloat {
        return self
    }

    public var vertical: CGFloat {
        return self
    }
}

extension Int: OffsetConvertible {

    public var horizontal: CGFloat {
        return CGFloat(self)
    }

    public var vertical: CGFloat {
        return CGFloat(self)
    }
}
