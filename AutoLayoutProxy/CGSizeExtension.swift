//
//  CGSizeExtension.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 06/09/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

public extension CGSize {
    
    public init(width: CGFloat = 0, height: CGFloat = 0) {
        self.init()
        
        self.width = width
        self.height = height
    }
}
