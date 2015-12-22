//
//  UICollectionView.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/22/15.
//  Copyright © 2015 Astraler Co., Ltd. All rights reserved.
//

import UIKit

extension UICollectionView {
  public enum SectionType {
    case Header
    case Footer
    var kind: String {
      switch self {
      case .Header: return UICollectionElementKindSectionHeader
      case .Footer: return UICollectionElementKindSectionFooter
      }
    }
  }
  
  public func registerNib<T: UICollectionViewCell>(aClass: T.Type) {
    let name = String(aClass)
    let nib = UINib(nibName: name, bundle: nil)
    registerNib(nib, forCellWithReuseIdentifier: name)
  }
  
  public func registerClass<T: UICollectionViewCell>(aClass: T.Type) {
    let name = String(aClass)
    registerClass(aClass, forCellWithReuseIdentifier: name)
  }
  
  public func registerNib<T: UICollectionReusableView>(aClass: T.Type, type: SectionType) {
    let name = String(aClass)
    let nib = UINib(nibName: name, bundle: nil)
    registerNib(nib, forSupplementaryViewOfKind: type.kind, withReuseIdentifier: name)
  }
  
  public func registerClass<T: UICollectionReusableView>(aClass: T.Type, type: SectionType) {
    let name = String(aClass)
    registerClass(aClass, forSupplementaryViewOfKind: type.kind, withReuseIdentifier: name)
  }
  
  public func dequeue<T: UICollectionViewCell>(aClass: T.Type, forIndexPath indexPath: NSIndexPath) -> T {
    return dequeueReusableCellWithReuseIdentifier(String(aClass), forIndexPath: indexPath) as! T
  }
  
  public func dequeue<T: UICollectionReusableView>(aClass: T.Type, type: SectionType, forIndexPath indexPath: NSIndexPath) -> T {
    return dequeueReusableSupplementaryViewOfKind(type.kind, withReuseIdentifier: String(aClass), forIndexPath: indexPath) as! T
  }
}
