//
//  LayoutAnchor.swift
//  AutoLayoutManager
//
//  Created by Bibin Jacob Pulickal on 15/10/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

public protocol LayoutAnchor {
    
    func constraint(equalTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
    
    func constraint(greaterThanOrEqualTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
    
    func constraint(lessThanOrEqualTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
}

extension NSLayoutAnchor: LayoutAnchor {}
