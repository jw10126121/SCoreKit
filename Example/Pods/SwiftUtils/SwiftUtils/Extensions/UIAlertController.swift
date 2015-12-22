//
//  UIAlertController.swift
//  TimorAir
//
//  Created by DaoNV on 8/23/15.
//  Copyright (c) 2015 Astraler Co., Ltd. All rights reserved.
//

import UIKit

let kAppName: String = {
  let info = NSBundle.mainBundle().infoDictionary!
  let display = info["CFBundleDisplayName"] as? String
  let name = info["CFBundleName"] as? String
  return display ?? name ?? "ALERT"
}()

public class AlertController: UIAlertController {
  var window: UIWindow! = {
    let window = UIWindow(frame: UIScreen.mainScreen().bounds)
    window.windowLevel = UIWindowLevelAlert + 1
    window.rootViewController = UIViewController()
    window.makeKeyAndVisible()
    return window
  }()
  
  override public func viewDidDisappear(animated: Bool) {
    super.viewDidDisappear(animated)
    window.hidden = true
    window = nil
  }
  
  public func present() {
    window.rootViewController?.presentViewController(self, animated: true, completion: nil)
  }
  
  public func dismiss(completion: (() -> Void)? = nil) {
    dismissViewControllerAnimated(true, completion: completion)
  }
}

public func alert(title title: String? = kAppName, msg: String, handler:(() -> Void)? = nil) -> UIAlertController {
  let alert = AlertController(title: title?.localized, message: msg.localized, preferredStyle: UIAlertControllerStyle.Alert)
  let ok = UIAlertAction(title: "OK".localized, style: UIAlertActionStyle.Cancel) { (action) -> Void in
    if let handler = handler {
      handler()
    }
  }
  alert.addAction(ok)
  alert.present()
  return alert
}

public func alert(error: NSError, handler:(() -> Void)? = nil) -> UIAlertController {
  let alert = AlertController(title: kAppName.localized, message: error.localizedDescription.localized, preferredStyle: UIAlertControllerStyle.Alert)
  let ok = UIAlertAction(title: "OK".localized, style: UIAlertActionStyle.Cancel) { (action) -> Void in
    if let handler = handler {
      handler()
    }
  }
  alert.addAction(ok)
  alert.present()
  return alert
}