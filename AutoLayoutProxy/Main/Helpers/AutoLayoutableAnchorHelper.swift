//
//  AutoLayoutableAnchorHelper.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 05/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

extension AutoLayoutable {

    public var leading: NSLayoutXAxisAnchor {
        return leadingAnchor
    }

    public var trailing: NSLayoutXAxisAnchor {
        return trailingAnchor
    }

    public var left: NSLayoutXAxisAnchor {
        return leftAnchor
    }

    public var right: NSLayoutXAxisAnchor {
        return rightAnchor
    }

    public var top: NSLayoutYAxisAnchor {
        return topAnchor
    }

    public var bottom: NSLayoutYAxisAnchor {
        return bottomAnchor
    }

    public var width: NSLayoutDimension {
        return widthAnchor
    }

    public var height: NSLayoutDimension {
        return heightAnchor
    }

    public var centerX: NSLayoutXAxisAnchor {
        return centerXAnchor
    }

    public var centerY: NSLayoutYAxisAnchor {
        return centerYAnchor
    }
}
