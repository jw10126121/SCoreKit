//
//  UIView.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/7/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import UIKit

public class IntrinsicContentView: UIView {
  public var intrinsicContentSizeEnabled = true
}

// MARK: Appearance
extension UIView {
  public func clear() {
    backgroundColor = UIColor.clearColor()
    for (_, sub) in subviews.enumerate() {
      sub.clear()
    }
  }
  
  public func border(color color: UIColor, width: CGFloat = 0.5) {
    layer.borderColor = color.CGColor
    layer.borderWidth = width
  }
  
  public enum BorderPostition {
    case Top
    case Left
    case Bottom
    case Right
  }
  
  public func border(pos: BorderPostition, color: UIColor = UIColor.blackColor(), width: CGFloat = 0.5, insets: UIEdgeInsets = UIEdgeInsetsZero) {
    let rect: CGRect = {
      switch pos {
      case .Top:    return CGRectMake(0, 0, frame.width, width)
      case .Left:   return CGRectMake(0, 0, width, frame.height)
      case .Bottom: return CGRectMake(0, frame.height - width, frame.width, width)
      case .Right:  return CGRectMake(frame.width - width, 0, width, frame.height)
      }
    }()
    let border = UIView(frame: rect)
    border.backgroundColor = color
    border.autoresizingMask = {
      switch pos {
      case .Top:    return [.FlexibleWidth, .FlexibleBottomMargin]
      case .Left:   return [.FlexibleHeight, .FlexibleRightMargin]
      case .Bottom: return [.FlexibleWidth, .FlexibleTopMargin]
      case .Right:  return [.FlexibleHeight, .FlexibleLeftMargin]
      }
    }()
    addSubview(border)
  }
  
  public func shadow(color color: UIColor, offset: CGSize = CGSizeZero, opacity: Float = 1.0, radius: CGFloat = 3.0) {
    layer.shadowColor = color.CGColor
    layer.shadowOffset = offset
    layer.shadowOpacity = opacity
    layer.shadowRadius = radius
    layer.shouldRasterize = true
    layer.rasterizationScale = UIScreen.mainScreen().scale
  }
}

// MARK: Layout
extension UIView {
  public func removeSubviewsConstraints() {
    removeConstraints(constraints.filter({ (c: NSLayoutConstraint) -> Bool in
      let first = c.firstItem as? UIView
      let second = c.secondItem as? UIView
      if (first == self && second == self) || (first == self && second == nil) || (first == nil && second == self) {
        return false
      }
      return true
    }))
    for sub in subviews {
      sub.translatesAutoresizingMaskIntoConstraints = false
      sub.removeAllConstraints()
    }
  }
  
  public func removeAllConstraints() {
    if let view = self as? IntrinsicContentView {
      if view.intrinsicContentSizeEnabled {
        return
      }
    }
    var parent = superview
    while parent != nil {
      for c in parent!.constraints {
        let first = c.firstItem as? UIView
        let second = c.secondItem as? UIView
        if first == self || second == self {
          parent!.removeConstraint(c)
        }
      }
      parent = parent!.superview
    }
    removeConstraints(constraints)
    let subviews = self.subviews
    for (_, sub) in subviews.enumerate() {
      sub.removeAllConstraints()
    }
  }
}