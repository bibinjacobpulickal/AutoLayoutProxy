//
//  BBMultiplier.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 23/04/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

#if canImport(CoreGraphics)
import CoreGraphics
#endif

public struct BBMultiplier {

    public var width: CGFloat

    public var height: CGFloat

    public init(w width: CGFloat = 1, h height: CGFloat = 1) {
        self.width  = width
        self.height = height
    }

    init(_ both: CGFloat = 1) {
        self.init(w: both, h: both)
    }

    public static let one = BBMultiplier()
}
