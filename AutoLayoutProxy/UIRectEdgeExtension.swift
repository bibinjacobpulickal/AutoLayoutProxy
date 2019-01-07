//
//  UIRectEdgeExtension.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 07/01/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public extension UIRectEdge {
    
    private static var _leading: UIRectEdge = UIRectEdge.init(rawValue: 16)
    private static var _trailing: UIRectEdge = UIRectEdge.init(rawValue: 17)
    private static var _centerX: UIRectEdge = UIRectEdge.init(rawValue: 18)
    private static var _centerY: UIRectEdge = UIRectEdge.init(rawValue: 19)
    
    static var leading: UIRectEdge {
        get {
            return _leading
        }
        set {
            _leading = newValue
        }
    }
    static var trailing: UIRectEdge {
        get {
            return _trailing
        }
        set {
            _trailing = newValue
        }
    }
    static var centerX: UIRectEdge {
        get {
            return _centerX
        }
        set {
            _centerX = newValue
        }
    }
    static var centerY: UIRectEdge {
        get {
            return _centerY
        }
        set {
            _centerY = newValue
        }
    }
}
