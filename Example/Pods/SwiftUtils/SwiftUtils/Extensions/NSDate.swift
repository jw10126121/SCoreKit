//
//  NSDate.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/7/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import Foundation

public class DateFormat {
  /** yyyy-MM-dd HH:mm:ss */
  public static var DateTime24          = "yyyy-MM-dd HH:mm:ss"
  /** yyyy-MM-dd HH:mm:ss Z*/
  public static var DateTime24Z        = "yyyy-MM-dd HH:mm:ss Z"
  /** yyyy-MM-dd hh:mm:ss a */
  public static var DateTime12          = "yyyy-MM-dd hh:mm:ss a"
  /** yyyy-MM-dd hh:mm:ss a Z*/
  public static var DateTime12Z        = "yyyy-MM-dd hh:mm:ss a Z"
  /** yyyy-MM-dd HH:mm */
  public static var DateTime24NoSec     = "yyyy-MM-dd HH:mm"
  /** yyyy-MM-dd hh:mm a */
  public static var DateTime12NoSec     = "yyyy-MM-dd hh:mm a"
  /** yyyy-MM-dd */
  public static var Date                = "yyyy-MM-dd"
  /** HH:mm:ss */
  public static var Time24              = "HH:mm:ss"
  /** hh:mm:ss a */
  public static var Time12              = "hh:mm:ss a"
  /** HH:mm */
  public static var Time24NoSec         = "HH:mm"
  /** hh:mm a */
  public static var Time12NoSec         = "hh:mm a"
  
  /** yyyy-MM-dd'T'HH:mm:ss */
  public static var TDateTime           = "yyyy-MM-dd'T'HH:mm:ss"
  /** yyyy-MM-dd'T'HH:mm:ss.SSS'Z' */
  public static var TDateTime3          = "yyyy-MM-dd'T'HH:mm:ss.SSS"
  /** yyyy-MM-dd'T'HH:mm:ss.SSSSSS */
  public static var TDateTime6          = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
  
  /** yyyy-MM-dd'T'HH:mm:ss'Z' */
  public static var TZDateTime          = "yyyy-MM-dd'T'HH:mm:ss'Z'"
  /** yyyy-MM-dd'T'HH:mm:ss.SSS'Z' */
  public static var TZDateTime3         = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
  /** yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z' */
  public static var TZDateTime6         = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
}

extension NSTimeInterval {
  public var time: String {
    var mm = Int(trunc(self / 60))
    let hh = mm/60
    mm %= 60
    if hh < 1 {
      return "\(mm)m"
    } else {
      return "\(hh)h\(mm)m"
    }
  }
  
  public var clock: String {
    var duration = Int(self)
    let hour = duration / 3600
    duration %= 3600
    let mins = duration / 60
    duration %= 60
    let secs = duration
    let suffix = String(format: "%@%d:%@%d", mins > 9 ? "" : "0", mins, secs > 9 ? "" : "0", secs)
    let prefix = hour > 0 ? String(format: "%@%d:", hour > 9 ? "" : "0" , hour) : ""
    return String(format: "%@%@", prefix, suffix)
  }
}

extension String {
  public func toDate(format: String, localized: Bool) -> NSDate {
    return NSDate(str: self, format: format, localized: localized)
  }
}

extension NSDate {
  public static var zero: NSDate {
    let comps = NSDateComponents(year: 0,month: 1, day: 1)
    comps.timeZone = NSTimeZone.utcTimeZone()
    let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
    calendar.timeZone = NSTimeZone.utcTimeZone()
    return calendar.dateFromComponents(comps)!
  }
  
  public convenience init(str: String, format: String, localized: Bool) {
    let fmt = NSDateFormatter.fromFormat(format)
    fmt.timeZone = localized ? NSTimeZone.localTimeZone() : NSTimeZone.utcTimeZone()
    if let date = fmt.dateFromString(str) {
      self.init(timeInterval: 0, sinceDate: date)
    } else {
      self.init(timeInterval: 0, sinceDate: NSDate.zero)
    }
  }
  
  public func toString(format: String, localized: Bool) -> String {
    let fmt = NSDateFormatter.fromFormat(format)
    fmt.timeZone = localized ? NSTimeZone.localTimeZone() : NSTimeZone.utcTimeZone()
    return fmt.stringFromDate(self)
  }
  
  public func timeAgo(info: [String : String]? = nil) -> String {
    var titles: [String : String] = [
      "year" : " year",
      "month" : " month",
      "week" : " week",
      "day" : "d",
      "hour" : "h",
      "minute" : "m",
      "yesterday" : "yesterday",
      "now" : "now"
    ]
    titles.updateValues(info)
    let units: NSCalendarUnit = [.Day, .WeekOfYear, .Month, .Year]
    let options = NSCalendarOptions()
    let now = NSDate()
    if timeIntervalSinceDate(now) > 0 {
      return ""
    }
    // if `date` is before "now" (i.e. in the past) then the components will be positive
    let comps = NSCalendar.currentCalendar().components(units, fromDate: self, toDate: NSDate(), options: options)
    if comps.year > 0 {
      let s = comps.year == 1 ? "" : "s"
      return "\(comps.year)year\(s) ago"
    }
    else if comps.month > 0 {
      let s = comps.month == 1 ? "" : "s"
      return "\(comps.month)month\(s) ago"
    }
    else if (comps.weekOfYear > 0) {
      let s = comps.weekOfYear == 1 ? "" : "s"
      return "\(comps.weekOfYear)week\(s) ago"
    }
    else if (comps.day > 0) {
      if comps.day > 1 {
        let s = comps.day == 1 ? "" : "s"
        return "\(comps.day)d\(s) ago"
      }
      else {
        return "yesterday"
      }
    }
    else {
      if comps.hour > 0 {
        let s = comps.hour == 1 ? "" : "s"
        return "\(comps.hour)h\(s) ago"
      }
      else {
        if comps.minute > 0 {
          let s = comps.minute == 1 ? "" : "s"
          return "\(comps.minute)m\(s) ago"
        }
        else {
          return "now"
        }
      }
    }
  }
}

extension NSTimeZone {
  public static func utcTimeZone() -> NSTimeZone {
    return NSTimeZone(abbreviation: "UTC")!
  }
}

extension NSDateComponents {
  public convenience init(year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0, sec: Int = 0, nsec: Int = 0) {
    self.init()
    self.year = year
    self.month = month
    self.day = day
    self.hour = hour
    self.minute = minute
    self.second = sec
    self.nanosecond = nsec
  }
}

var fmts = [String : NSDateFormatter]()
let lock = NSLock()
extension NSDateFormatter {
  public static func fromFormat(format: String!) -> NSDateFormatter! {
    lock.lock()
    var fmt: NSDateFormatter!
    if let existFmt = fmts[format] {
      fmt = existFmt
    } else {
      fmt = NSDateFormatter()
      fmt.dateFormat = format
      fmts[format] = fmt
    }
    lock.unlock()
    return fmt
  }
}