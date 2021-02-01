//
//  UITableView+Extensions.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 01/02/2021.
//

import UIKit

extension UITableView {
    
    public func register<T: UITableViewCell>(cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }
}

extension UITableViewCell {
    
    static var reuseIdentifier: String {
        return NSStringFromClass(self)
    }
    
}
