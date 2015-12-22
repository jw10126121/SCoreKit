//
//  CGPoint.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/8/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import UIKit

// MARK: CGPoint
extension CGPoint {
  public var isZero: Bool {
    return x == 0 && y == 0
  }
}

public prefix func -(a: CGPoint) -> CGPoint {
  return CGPoint(x: -a.x, y: -a.y)
}

public func ==(a: CGPoint, b: CGPoint) -> Bool {
  return a.x == b.x && a.y == b.y
}

public func +=(inout a: CGPoint, b: CGPoint) -> CGPoint {
  a.x += b.x
  a.y += b.y
  return a
}

public func +=(inout a: CGPoint, s: CGSize) -> CGPoint {
  a.x += s.w
  a.y += s.h
  return a
}

public func +=(inout a: CGPoint, v: CGVector) -> CGPoint {
  a.x += v.dx
  a.y += v.dy
  return a
}

public func +=(inout a: CGPoint, k: CGFloat) -> CGPoint {
  a.x += k
  a.y += k
  return a
}

public func +(a: CGPoint, b: CGPoint) -> CGPoint {
  return CGPoint(x: a.x + b.x, y: a.y + b.y)
}

public func +(a: CGPoint, s: CGSize) -> CGPoint {
  return CGPoint(x: a.x + s.w, y: a.y + s.h)
}

public func +(a: CGPoint, v: CGVector) -> CGPoint {
  return CGPoint(x: a.x + v.dx, y: a.y + v.dy)
}

public func +(a: CGPoint, k: CGFloat) -> CGPoint {
  return CGPoint(x: a.x + k, y: a.y + k)
}

public func -=(inout a: CGPoint, b: CGPoint) -> CGPoint {
  a.x -= b.x
  a.y -= b.y
  return a
}

public func -=(inout a: CGPoint, s: CGSize) -> CGPoint {
  return CGPoint(x: a.x - s.w, y: a.y - s.h)
}

public func -=(inout a: CGPoint, k: CGVector) -> CGPoint {
  a.x -= k.dx
  a.y -= k.dy
  return a
}

public func -=(inout a: CGPoint, k: CGFloat) -> CGPoint {
  a.x -= k
  a.y -= k
  return a
}

public func -(a: CGPoint, b: CGPoint) -> CGPoint {
  return CGPoint(x: a.x - b.x, y: a.y - b.y)
}

public func -(a: CGPoint, s: CGSize) -> CGPoint {
  return CGPoint(x: a.x - s.width, y: a.y - s.height)
}

public func -(a: CGPoint, v: CGVector) -> CGPoint {
  return CGPoint(x: a.x - v.dx, y: a.y - v.dy)
}

public func -(a: CGPoint, k: CGFloat) -> CGPoint {
  return CGPoint(x: a.x - k, y: a.y - k)
}

public func *=(inout a: CGPoint, k: CGFloat) -> CGPoint {
  a.x *= k
  a.y *= k
  return a
}

public func *(a: CGPoint, k: CGFloat) -> CGPoint {
  return CGPoint(x: a.x * k, y: a.y * k)
}

public func /=(inout a: CGPoint, k: CGFloat) -> CGPoint {
  a.x /= k
  a.y /= k
  return a
}

public func /(a: CGPoint, k: CGFloat) -> CGPoint {
  return CGPoint(x: a.x / k, y: a.y / k)
}

// MARK: CGSize
extension CGSize {
  public var w: CGFloat {
    set {
      width = newValue
    }
    get {
      return width
    }    
  }
  
  public var h: CGFloat {
    set {
      height = newValue
    }
    get {
      return height
    }
  }
  
  public var isZero: Bool {
    return width <= 0 || height <= 0
  }
}

public func +=(inout s: CGSize, t: CGSize) -> CGSize {
  s.width += t.width
  s.height += t.height
  return s
}

public func +(s: CGSize, t: CGSize) -> CGSize {
  return CGSize(width: s.width + t.width, height: s.height + t.height)
}

public func -=(inout s: CGSize, t: CGSize) -> CGSize {
  s.width -= t.width
  s.height -= t.height
  return s
}

public func -(s: CGSize, t: CGSize) -> CGSize {
  return CGSize(width: s.width - t.width, height: s.height - t.height)
}

public func *=(inout s: CGSize, k: CGFloat) -> CGSize {
  s.width *= k
  s.height *= k
  return s
}

public func *(size: CGSize, k: CGFloat) -> CGSize {
  return CGSize(width: size.width * k, height: size.height * k)
}

public func /=(inout size: CGSize, k: CGFloat) -> CGSize {
  size.width /= k
  size.height /= k
  return size
}

public func /(size: CGSize, k: CGFloat) -> CGSize {
  return CGSize(width: size.width / k, height: size.height / k)
}

// MARK: CGVector
extension CGVector {
  public init(x: CGFloat, y: CGFloat) {
    self.init(dx: x, dy: y)
  }
  
  public var x: CGFloat {
    set {
      dx = newValue
    }
    get {
      return dx
    }
  }
  
  public var y: CGFloat {
    set {
      dy = newValue
    }
    get {
      return dy
    }
  }
  
  public var isZero: Bool {
    return dx == 0 && dy == 0
  }
}

public prefix func -(u: CGVector) -> CGVector {
  return CGVector(dx: -u.dx, dy: -u.dy)
}

public func ==(u: CGVector, v: CGVector) -> Bool {
  return u.dx == v.dx && u.dy == v.dy
}

public func +(u: CGVector, v: CGVector) -> CGVector {
  return CGVector(dx: u.dx + v.dx, dy: u.dy + v.dy)
}

public func +=(inout u: CGVector, v: CGVector) -> CGVector {
  u.dx += v.dx
  u.dy += v.dy
  return u
}

public func -(u: CGVector, v: CGVector) -> CGVector {
  return CGVector(dx: u.dx - v.dx, dy: u.dy - v.dy)
}

public func *(u: CGVector, v: CGVector) -> CGFloat {
  return u.dx * v.dy + u.dy * v.dx
}

public func *(u: CGVector, k: CGFloat) -> CGVector {
  return CGVector(dx: u.dx * k, dy: u.dy * k)
}

public func /(u: CGVector, k: CGFloat) -> CGVector {
  return CGVector(dx: u.dx / k, dy: u.dy / k)
}

public func /=(inout u: CGVector, k: CGFloat) -> CGVector {
  u.dx /= k
  u.dy /= k
  return u
}

// MARK: CGRect
extension CGRect {
  public var x: CGFloat {
    return origin.x
  }
  
  public var y: CGFloat {
    return origin.y
  }
  
  public var w: CGFloat {
    return size.width
  }
  
  public var h: CGFloat {
    return size.height
  }
}

public func +(r: CGRect, p: CGPoint) -> CGRect {
  let b = CGPoint(x: r.origin.x + p.x, y: r.origin.y + p.y)
  return CGRect(origin: b, size: r.size)
}

public func +(r: CGRect, v: CGVector) -> CGRect {
  let b = CGPoint(x: r.origin.x + v.dx, y: r.origin.y + v.dy)
  return CGRect(origin: b, size: r.size)
}

public func +(r: CGRect, s: CGSize) -> CGRect {
  let s = CGSize(width: r.size.width + s.width, height: r.size.height + s.height)
  return CGRect(origin: r.origin, size: s)
}

public func -(r: CGRect, p: CGPoint) -> CGRect {
  let b = CGPoint(x: r.origin.x - p.x, y: r.origin.y - p.y)
  return CGRect(origin: b, size: r.size)
}

public func -(r: CGRect, v: CGVector) -> CGRect {
  let b = CGPoint(x: r.origin.x - v.dx, y: r.origin.y - v.dy)
  return CGRect(origin: b, size: r.size)
}

public func -(r: CGRect, s: CGSize) -> CGRect {
  let s = CGSize(width: r.size.width - s.width, height: r.size.height - s.height)
  return CGRect(origin: r.origin, size: s)
}