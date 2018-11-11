//
//  LayoutProxy.swift
//  AutoLayoutManager
//
//  Created by Bibin Jacob Pulickal on 28/10/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

public class LayoutProxy {
    
    public lazy var leading = property(with: view.leadingAnchor)
    public lazy var trailing = property(with: view.trailingAnchor)
    public lazy var top = property(with: view.topAnchor)
    public lazy var bottom = property(with: view.bottomAnchor)
    public lazy var left = property(with: view.leftAnchor)
    public lazy var right = property(with: view.rightAnchor)
    public lazy var width = property(with: view.widthAnchor)
    public lazy var height = property(with: view.heightAnchor)
    public lazy var centerX = property(with: view.centerXAnchor)
    public lazy var centerY = property(with: view.centerYAnchor)
    
    private let view: UIView
    
    init(view: UIView) {
        self.view = view
    }
    
    public func property<A>(with anchor: A) -> LayoutProperty<A> {
        return LayoutProperty(anchor: anchor)
    }
}
