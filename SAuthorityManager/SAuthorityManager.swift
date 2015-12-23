//
//  STool.swift
//  Pods
//
//  Created by linjiawei on 15/12/22.
//
//

import UIKit
import Photos
import AssetsLibrary
import AVFoundation
import MapKit

public enum SAuthorizationStatus : Int {
    
    case NotDetermined      // 用户尚未做出选择这个应用程序的问候
    case Restricted         // 此应用程序没有被授权访问的照片数据。可能是家长控制权限
    case Denied             // 用户已经明确否认了这一照片数据的应用程序访问
    case Authorized         // 用户已经授权应用访问照片数据
 
}

public class SAuthorizationManager : NSObject {

//    MARK: - 相机权限
    public class func sIsGetCameraPermission() -> (Bool,SAuthorizationStatus?) {
        let authStaus = AVCaptureDevice.authorizationStatusForMediaType(AVMediaTypeVideo)
        var permissionBool : Bool = false
        if authStaus==AVAuthorizationStatus.Denied || authStaus==AVAuthorizationStatus.Restricted {
            permissionBool = false;
        } else
        {
            permissionBool = true
        }
        return (permissionBool,SAuthorizationStatus(rawValue: authStaus.rawValue))
    }
    
//    MARK: - 获取相机权限
    public class func sToGetCameraAuthority(completionHandler handler: ((Bool) -> Void)!) -> Void {
        AVCaptureDevice.requestAccessForMediaType(AVMediaTypeVideo,completionHandler: handler)
    }
    
//    MARK: - 相册权限
    public class func sIsGetAssetsLibraryPermission() -> (Bool,SAuthorizationStatus?)
    {
        let isIos8orLater = Float(UIDevice.currentDevice().systemVersion) >= 8.0

        if isIos8orLater {
            let authStaus = PHPhotoLibrary.authorizationStatus()
            var permissionBool : Bool = false
            if authStaus==PHAuthorizationStatus.Denied || authStaus==PHAuthorizationStatus.Restricted {
                permissionBool = false;
            } else
            {
                permissionBool = true
            }
            return (permissionBool,SAuthorizationStatus(rawValue: authStaus.rawValue))
        } else {
            let authStaus = ALAssetsLibrary.authorizationStatus()
            var permissionBool : Bool = false
            if authStaus==ALAuthorizationStatus.Denied || authStaus==ALAuthorizationStatus.Restricted {
                permissionBool = false;
            } else
            {
                permissionBool = true
            }
            return (permissionBool,SAuthorizationStatus(rawValue: authStaus.rawValue))
        }
    }

//    MARK: - 获取相册权限
    public class func sToGetAssetsLibraryAuthority(completionHandler handler: ((Bool) -> Void)!) -> Void {
        
        let isIos8orLater = Float(UIDevice.currentDevice().systemVersion) >= 8.0
        if isIos8orLater {
            PHPhotoLibrary.requestAuthorization { (authStaus: PHAuthorizationStatus) -> Void in
                handler(!(authStaus==PHAuthorizationStatus.Denied || authStaus==PHAuthorizationStatus.Restricted))
            }
        } else {
            AVCaptureDevice.requestAccessForMediaType(AVMediaTypeVideo,completionHandler: handler)
        }

    }
    
//    MARK: - 获取定位权限
    public class func sToGetLocationAuthority() -> Bool {
        
       return CLLocationManager.locationServicesEnabled()
    }
    
    
    
    
    
}



