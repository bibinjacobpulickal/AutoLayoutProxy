//
//  UIEdgeInsetsExtension.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 06/09/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {
    
    private static var _leading: CGFloat = 0
    private static var _trailing: CGFloat = 0
    private static var _centerX: CGFloat = 0
    private static var _centerY: CGFloat = 0
    
    var leading: CGFloat {
        get {
            return UIEdgeInsets._leading
        }
        set {
            UIEdgeInsets._leading = newValue
        }
    }
    var trailing: CGFloat {
        get {
            return UIEdgeInsets._trailing
        }
        set {
            UIEdgeInsets._trailing = newValue
        }
    }
    var centerX: CGFloat {
        get {
            return UIEdgeInsets._centerX
        }
        set {
            UIEdgeInsets._centerX = newValue
        }
    }
    var centerY: CGFloat {
        get {
            return UIEdgeInsets._centerY
        }
        set {
            UIEdgeInsets._centerY = newValue
        }
    }
    
    public init(top: CGFloat = 0, left: CGFloat = 0, leading: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0, trailing: CGFloat = 0, centerX: CGFloat = 0, centerY: CGFloat = 0) {
        self.init(top: top, left: left, bottom: bottom, right: right)
        
        self.leading = leading
        self.trailing = trailing
        self.centerX = centerX
        self.centerY = centerY
    }
}
