//
//  UIOffsetConvertible.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 01/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

protocol UIOffsetConvertible {
    func asUIOffsetConvertible() -> UIOffset
}

extension UIOffset: UIOffsetConvertible {
    func asUIOffsetConvertible() -> UIOffset {
        return self
    }
}

extension CGFloat: UIOffsetConvertible {
    func asUIOffsetConvertible() -> UIOffset {
        return UIOffset(self)
    }
}
