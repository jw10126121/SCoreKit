//
//  Range.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/9/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import UIKit

extension Range {
  public static func random(from: Int, to: Int) -> Range<Int> {
    let lowerBound = Int.random(min: from, max: to)
    let upperBound = Int.random(min: lowerBound, max: to)
    return lowerBound...upperBound
  }
}