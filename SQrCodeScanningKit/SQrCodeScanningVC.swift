//
//  STool.swift
//  Pods
//
//  Created by linjiawei on 15/12/22.
//
//

import UIKit


public class SQrCodeScanningVC : UIViewController {
    
    


    
    
}


//    MARK: - 生成图片(二维码、条形码等)，读取图片(二维码、条形码等)
public extension SQrCodeScanningVC {
    
    /**
    生成二维码
    
    - parameter qrCodeStr: 二维码字符串
    - parameter size:      大小
    - parameter forColor:  前景色
    - parameter backColor: 背景色
    
    - returns: 二维码图片
    */
    public class func sImageForQrCode(qrCodeStr: String , size: CGSize , forColor: UIColor? = UIColor.blackColor(),backColor: UIColor? = UIColor.whiteColor()) -> UIImage? {
        
        let qrColor = forColor ?? UIColor.blackColor()
        let bkColor = backColor ?? UIColor.whiteColor()
        
        let codeType = "CIQRCodeGenerator"
        let stringData = qrCodeStr.dataUsingEncoding(NSUTF8StringEncoding)
        
        //系统自带能生成的码
        //        CIAztecCodeGenerator
        //        CICode128BarcodeGenerator
        //        CIPDF417BarcodeGenerator
        //        CIQRCodeGenerator
        let qrFilter = CIFilter(name: codeType)
        
        qrFilter?.setValue(stringData, forKey: "inputMessage")
        
        qrFilter?.setValue("H", forKey: "inputCorrectionLevel")
        
        //上色
        let colorFilter = CIFilter(name: "CIFalseColor", withInputParameters: ["inputImage":qrFilter!.outputImage!,"inputColor0":CIColor(CGColor: qrColor.CGColor),"inputColor1":CIColor(CGColor: bkColor.CGColor)])
        
        let qrImage = colorFilter!.outputImage;
        
        //绘制
        let cgImage = CIContext().createCGImage(qrImage!, fromRect: qrImage!.extent)
        
        UIGraphicsBeginImageContext(size);
        let context = UIGraphicsGetCurrentContext();
        CGContextSetInterpolationQuality(context, CGInterpolationQuality.None);
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextDrawImage(context, CGContextGetClipBoundingBox(context), cgImage);
        let codeImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return codeImage
    }
    
    /**
     生成条形码
     
     - parameter barCodeStr: 条形码字符串
     - parameter size:       大小
     
     - returns: 条形码图片
     */
    public class func sImageForBarCode(barCodeStr: String , size: CGSize ) -> UIImage? {
        
        let stringData = barCodeStr.dataUsingEncoding(NSUTF8StringEncoding,allowLossyConversion: false)
        
        let qrFilter = CIFilter(name: "CICode128BarcodeGenerator")
        qrFilter?.setDefaults()
        qrFilter?.setValue(stringData, forKey: "inputMessage")
        
        let outputImage:CIImage? = qrFilter?.outputImage
        let context = CIContext()
        let cgImage = context.createCGImage(outputImage!, fromRect: outputImage!.extent)
        
        let image = UIImage(CGImage: cgImage, scale: 1.0, orientation: UIImageOrientation.Up)
        
        let scaleRate:CGFloat = 20.0
        let resized = __resizeImage(image, quality: CGInterpolationQuality.None, rate: scaleRate)
        
        return resized;
    }
    
    /**
     图片中识别二维码
     
     - parameter qrCodeImg: 二维码图片
     
     - returns: 二维码字符串
     */
    public class func sQrCodeStr(qrCodeImg: UIImage) -> String? {
        let detector:CIDetector = CIDetector(ofType: CIDetectorTypeQRCode, context: nil, options: [CIDetectorAccuracy:CIDetectorAccuracyHigh])
        let img = CIImage(CGImage: (qrCodeImg.CGImage)!)
        let features:[CIFeature]? = detector.featuresInImage(img, options: [CIDetectorAccuracy:CIDetectorAccuracyHigh])
        if( features != nil && features?.count > 0)
        {
            let feature = features![0]
            
            if feature.isKindOfClass(CIQRCodeFeature)
            {
                let featureTmp:CIQRCodeFeature = feature as! CIQRCodeFeature
                
                let scanResult = featureTmp.messageString
                
                return scanResult
            }
        }
        
        return nil;
    }

}


//    MARK: - 辅助方法
extension SQrCodeScanningVC {

    //图像缩放
    static private func __resizeImage(image:UIImage,quality:CGInterpolationQuality,rate:CGFloat)->UIImage?
    {
        var resized:UIImage?;
        let width    = image.size.width * rate;
        let height   = image.size.height * rate;
        
        UIGraphicsBeginImageContext(CGSizeMake(width, height));
        let context = UIGraphicsGetCurrentContext();
        CGContextSetInterpolationQuality(context, quality);
        image.drawInRect(CGRectMake(0, 0, width, height))
        
        resized = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return resized;
    }
}
