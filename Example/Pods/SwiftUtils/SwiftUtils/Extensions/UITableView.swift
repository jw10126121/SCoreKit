//
//  UITableView.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/7/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import UIKit

extension UITableView {
  override public var delaysContentTouches: Bool {
    didSet {
      for view in subviews {
        if let scroll = view as? UIScrollView {
          scroll.delaysContentTouches = delaysContentTouches
        }
        break
      }
    }
  }
  
  public func setSeparatorInsets(insets: UIEdgeInsets) {
    separatorInset = insets
    layoutMargins = insets
  }
  
  public func registerNib<T: UITableViewCell>(aClass: T.Type) {
    let name = String(aClass)
    let nib = UINib(nibName: name, bundle: nil)
    registerNib(nib, forCellReuseIdentifier: name)
  }
  
  public func registerClass<T: UITableViewCell>(aClass: T.Type) {
    let name = String(aClass)
    registerClass(aClass, forCellReuseIdentifier: name)
  }
  
  public func registerNib<T: UITableViewHeaderFooterView>(aClass: T.Type) {
    let name = String(aClass)
    let nib = UINib(nibName: name, bundle: nil)
    registerNib(nib, forHeaderFooterViewReuseIdentifier: name)
  }
  
  public func registerClass<T: UITableViewHeaderFooterView>(aClass: T.Type) {
    let name = String(aClass)
    registerClass(aClass, forHeaderFooterViewReuseIdentifier: name)
  }
  
  public func dequeue<T: UITableViewCell>(aClass: T.Type) -> T {
    return dequeueReusableCellWithIdentifier(String(aClass)) as! T
  }
  
  public func dequeue<T: UITableViewHeaderFooterView>(aClass: T.Type) -> T {
    return dequeueReusableHeaderFooterViewWithIdentifier(String(aClass)) as! T
  }
}

extension UITableViewCell {
  public func setSeparatorInsets(insets: UIEdgeInsets) {
    separatorInset = insets
    layoutMargins = insets
  }
}