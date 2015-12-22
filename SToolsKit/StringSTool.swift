//
//  STool.swift
//  Pods
//
//  Created by linjiawei on 15/12/21.
//
//

import UIKit

public extension String {
    
    public var intValue: Int            {  return (self as NSString).integerValue  }
    
    public var doubleValue: Double      {  return (self as NSString).doubleValue   }
    
    public var floatValue: Float        {   return (self as NSString).floatValue   }
    
    public var boolValue: Bool          {  return (self as NSString).boolValue     }
    
    public var integerValue: Int        {  return (self as NSString).integerValue  }
    
    public var longLongValue: Int64     {  return (self as NSString).longLongValue }
    
    /**
     获取文本大小
     
     - parameter maxSize: 最大范围
     - parameter font:    字体
     
     - returns: 文本大小
     */
    public func sSize(MaxSize maxSize : CGSize,Font font : UIFont,Offset offset : CGSize? = CGSizeZero) -> CGSize {
        var tDic = [String:NSObject]()
        tDic[NSFontAttributeName] = font
        let paragraphStyle : NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = NSLineBreakMode.ByWordWrapping
        tDic[NSParagraphStyleAttributeName] = paragraphStyle;
        
        let bounds = (self as NSString).boundingRectWithSize(maxSize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: tDic, context: nil)
        var theSize = CGSizeMake(CGFloat(ceilf(Float(bounds.size.width))), CGFloat(ceilf(Float(bounds.size.height))))
        if offset != nil {
            theSize += offset!;
        }
        return theSize
    }
    
    
    
    
    
}
