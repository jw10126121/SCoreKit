//
//  NSFileManager.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/23/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import Foundation

extension NSFileManager {
  public static var docDir: String {
    return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
  }
  
  public static var docUrl: NSURL {
    return defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
  }
  
  public static var appSupportDir: String {
    return NSSearchPathForDirectoriesInDomains(.ApplicationSupportDirectory, .UserDomainMask, true).first!
  }
  
  public static var appSupportUrl: NSURL {
    return defaultManager().URLsForDirectory(.ApplicationSupportDirectory, inDomains: .UserDomainMask).first!
  }
  
  public static var tmpDir: String {
    return NSTemporaryDirectory()
  }
  
  public static var tmpUrl: NSURL {
    return NSURL.fileURLWithPath(NSTemporaryDirectory(), isDirectory: true)
  }
  
  public static func addSkipBackupAttributeToItemAtURL(url: NSURL) -> Bool {
    if let path = url.path {
      if defaultManager().fileExistsAtPath(path) {
        do {
          try url.setResourceValue(true, forKey: NSURLIsExcludedFromBackupKey)
          return true
        } catch {
          return false
        }
      }
    }
    return false
  }
}