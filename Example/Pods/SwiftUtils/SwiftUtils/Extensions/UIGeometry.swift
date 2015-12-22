//
//  UIEdgeInsets.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/7/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
  public var inverse: UIEdgeInsets {
    return UIEdgeInsets(top: -top, left: -left, bottom: -bottom, right: -right)
  }
  
  public func inset(rect: CGRect) -> CGRect {
    return UIEdgeInsetsInsetRect(rect, self)
  }
  
  public var isZero: Bool {
    return top == 0 && left == 0 && bottom == 0 && right == 0
  }
}