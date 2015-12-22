//
//  STool.swift
//  Pods
//
//  Created by linjiawei on 15/12/22.
//
//

import UIKit

// MARK: - CGRect
public extension CGRect {
    
    public var x: CGFloat { return origin.x    }
    public var y: CGFloat { return origin.y    }
    public var w: CGFloat { return size.width  }
    public var h: CGFloat { return size.height }
    
}

public func +(r: CGRect, p: CGPoint) -> CGRect {
    let b = CGPoint(x: r.origin.x + p.x, y: r.origin.y + p.y)
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

public func -(r: CGRect, s: CGSize) -> CGRect {
    let s = CGSize(width: r.size.width - s.width, height: r.size.height - s.height)
    return CGRect(origin: r.origin, size: s)
}

// MARK: - CGSize

public extension CGSize {
    public var isZero: Bool {return CGSizeEqualToSize(self, CGSizeZero) }
}

public func +(s: CGSize, t: CGSize) -> CGSize {
    return CGSize(width: s.width + t.width, height: s.height + t.height)
}

public func -(s: CGSize, t: CGSize) -> CGSize {
    return CGSize(width: s.width - t.width, height: s.height - t.height)
}

public func +=(inout s: CGSize, t: CGSize) -> CGSize {
    s.width += t.width
    s.height += t.height
    return s
}

public func -=(inout s: CGSize, t: CGSize) -> CGSize {
    s.width -= t.width
    s.height -= t.height
    return s
}

// MARK: - CGPoint

public extension CGPoint {
    public var isZero: Bool {return CGPointEqualToPoint(self, CGPointZero) }
}

public prefix func -(a: CGPoint) -> CGPoint {
    return CGPoint(x: -a.x, y: -a.y)
}

