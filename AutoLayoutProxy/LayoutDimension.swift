//
//  LayoutDimension.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 28/10/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

public protocol LayoutDimension {
    
    func constraint(equalToConstant: CGFloat) -> NSLayoutConstraint
    
    func constraint(greaterThanOrEqualToConstant: CGFloat) -> NSLayoutConstraint
    
    func constraint(lessThanOrEqualToConstant: CGFloat) -> NSLayoutConstraint
    
    func constraint(equalTo: Self, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint
    
    func constraint(greaterThanOrEqualTo: Self, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint
    
    func constraint(lessThanOrEqualTo: Self, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint
}

extension NSLayoutDimension: LayoutDimension {}
