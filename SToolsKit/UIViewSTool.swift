//
//  UIViewSTool.swift
//  Pods
//
//  Created by linjiawei on 15/12/22.
//
//

import UIKit

public extension UIView {

//  MARK: - 属性
    
    public var x: Float             {
        get { return Float(self.frame.origin.x) }
        set { var frame = self.frame;frame.origin.x = CGFloat(newValue);self.frame = frame;}
    }
    
    public var y: Float             {
        get { return Float(self.frame.origin.y) }
        set { var frame = self.frame;frame.origin.y = CGFloat(newValue);self.frame = frame;}
    }
    
    public var w: Float             {
        get { return Float(self.frame.size.width) }
        set { var frame = self.frame;frame.size.width = CGFloat(newValue);self.frame = frame;}
    }
    
    public var width: Float         {
        get { return Float(self.frame.size.width) }
        set { var frame = self.frame;frame.size.width = CGFloat(newValue);self.frame = frame;}
    }
    
    public var h: Float             {
        get { return Float(self.frame.size.height) }
        set { var frame = self.frame;frame.size.height = CGFloat(newValue);self.frame = frame;}
    }
    
    public var height: Float        {
        get { return Float(self.frame.size.height) }
        set { var frame = self.frame;frame.size.height = CGFloat(newValue);self.frame = frame;}
    }
    
    public var size: CGSize         {
        get { return self.frame.size }
        set { var frame = self.frame;frame.size = newValue;self.frame = frame;}
    }

    public var origin: CGPoint      {
        get { return self.frame.origin}
        set { var frame = self.frame;frame.origin = newValue;self.frame = frame;}
    }
    
    public var centerX: Float       {
        get { return Float(self.center.x) }
        set { self.center = CGPointMake(CGFloat(newValue), self.center.y)}
    }
    
    public var centerY: Float       {
        get { return Float(self.center.y) }
        set { self.center = CGPointMake(self.center.x, CGFloat(newValue))}
    }

    public var screenViewX: Float   {
        var x: Float = 0.0;
        for var view : UIView? = self ; view != nil ; view = view?.superview {
            x+=view!.x
            if view!.isKindOfClass(UIScrollView.self) {
                let scrollView: UIScrollView = view as! UIScrollView
                x-=Float(scrollView.contentOffset.x)
            }
        }
        return x;
    }
    
    public var screenViewY: Float   {
        var aY: Float = 0.0;
        for var view : UIView? = self ; view != nil ; view = view?.superview {
            aY+=view!.y
            if view!.isKindOfClass(UIScrollView.self) {
                let scrollView: UIScrollView = view as! UIScrollView
                aY-=Float(scrollView.contentOffset.y)
            }
        }
        return aY;
    }
    
    public var screenFrame: CGRect  {
        return CGRectMake(CGFloat(self.screenViewX), CGFloat(self.screenViewY), CGFloat(self.w), CGFloat(self.h));
    }
    
    
//  MARK: - 方法
    
    public func sRemoveAllSubviews() -> Void {
        self.subviews.forEach { $0.removeFromSuperview() }
    }
    
    public class func sImageForSnapshot(View aView: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(aView.bounds.size, aView.opaque, 0.0)
        aView.drawViewHierarchyInRect(aView.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return image
    }
    
    public func sRectInSuperView(aSuper: UIView?) -> CGRect {
        let frame = self.convertRect(self.bounds, toView: aSuper);
        return frame;
    }
    
    /**
     查找aSuperView上焦点所在的View
     */
    public class func sViewForFirstResponderInSuperView(aSuperView: UIView?) -> UIView? {

        for childView in aSuperView!.subviews {
            if childView.respondsToSelector("isFirstResponder") && childView.isFirstResponder() {
                 return childView
            }
            let result = self.sViewForFirstResponderInSuperView(childView)
            if result != nil {
                return result
            }
        }
        return nil;
    }
    

    public enum ViewLineDirection {
        case top
        case left
        case right
        case bottom
    }
    
//    public func sAddLine(Direction aDirection: ViewLineDirection , Size size: Float = 0.5 , Color color: UIColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1.0)) -> Void{
//        let lineView: UIView = UIView()
//        self.addSubview(lineView)
//    }
    
    
}








