//
//  Dictionary.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/7/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import Foundation

extension Dictionary {
  public var allKeys: [Key] {
    return Array(keys)
  }
  
  public var allValues: [Value] {
    return Array(values)
  }
  
  public mutating func updateValues(dic: [Key : Value]?) {
    if let dic = dic {
      for (key, value) in dic {
        self[key] = value
      }
    }
  }
  
  public func map<U, V>(trans: Element -> (U, V)?) -> [U : V] {
    var mapped = [U : V]()
    forEach { (e) -> () in
      if let e = trans(e) {
        mapped[e.0] = e.1
      }
    }
    return mapped
  }
  
  public func has(key: Key) -> Bool {
    return indexForKey(key) != nil
  }
  
  public mutating func shift() -> (Key, Value?)? {
    if let key = keys.first {
      return (key, removeValueForKey(key))
    }
    return nil
  }
}