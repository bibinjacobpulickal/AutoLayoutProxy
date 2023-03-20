//
//  Helpers.swift
//  AutoLayoutProxyDemo
//
//  Created by Bibin Jacob on 20/03/23.
//

import UIKit
import BBHelperKit
import AutoLayoutProxy

protocol View: AnyObject {
  var backgroundColor: UIColor? { get set }
}

extension View {

  @discardableResult func backgroundColor(_ color: UIColor) -> Self {
    backgroundColor = color
    return self
  }
}

extension UIView {
  static var random = UIView().backgroundColor(.random)
}

extension UIView: View { }

protocol StackView: View {
  var axis: NSLayoutConstraint.Axis { get set }
}

extension StackView {

  @discardableResult func axis(_ value: NSLayoutConstraint.Axis) -> Self {
    axis = value
    return self
  }
}

extension UIStackView: StackView { }
