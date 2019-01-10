//
//  NSObjectExtensions.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 10/01/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public func create<T>(_ setup: ((T) -> Void)) -> T where T: NSObject {
    let object = T()
    setup(object)
    return object
}

extension NSObject {
    class var identifier: String {
        return String(describing: self)
    }
}
