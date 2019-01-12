//
//  UITableViewExtension.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 10/01/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public extension UITableView {
    
    public func register<CellClass: NSObject>(_ cell: CellClass.Type) {
        register(cell, forCellReuseIdentifier: cell.identifier)
    }
    
    public func dequeue<CellClass: NSObject>(_ class: CellClass.Type, for indexPath: IndexPath, configure: ((CellClass) -> Void)) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: CellClass.identifier, for: indexPath)
        if let cell = cell as? CellClass {
            configure(cell)
        }
        return cell
    }
}
