//
//  FloatTableView.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/5/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import UIKit

public class FloatTableView: UITableView {
  public var allowHeaderViewsToFloat: Bool = true
  public var allowFooterViewsToFloat: Bool = true
  
  public func allowsHeaderViewsToFloat() -> Bool {
    return allowHeaderViewsToFloat
  }
  
  public func allowsFooterViewsToFloat() -> Bool {
    return allowFooterViewsToFloat
  }
}
