//
//  ViewController.swift
//  SCoreKit
//
//  Created by linjiawei on 12/21/2015.
//  Copyright (c) 2015 linjiawei. All rights reserved.
//

import UIKit
import SCoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        let btn = UIButton(frame: CGRectMake(100,100,100,100))
        btn.backgroundColor = UIColor.redColor()
        btn.addTarget(self, action: "btnClick", forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)
        
        
        
        let barCodeImgV = UIImageView(frame: CGRectMake(50, 220, 100, 50))
        self.view.addSubview(barCodeImgV)
        barCodeImgV.image = SQrCodeScanningVC.sImageForBarCode("9787305158018", size: barCodeImgV.size)
    }
    
    func btnClick() {
        let view = SQrCodeScanningVC()
        self.presentViewController(view, animated: true) { () -> Void in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

