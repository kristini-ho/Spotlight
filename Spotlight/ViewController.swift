//
//  ViewController.swift
//  Spotlight
//
//  Created by Kristin Ho on 2/17/16.
//  Copyright © 2016 Kristin Ho. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var onOffControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentChanged(sender: AnyObject) {
        if(onOffControl.selectedSegmentIndex == 0){
            print("Light on!")
            toggleTorch(on: true)
        }
        else{
            print("Light off!")
            toggleTorch(on: false)
        }
    }
 
    
    func toggleTorch(on on: Bool) {
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on == true {
                    device.torchMode = .On
                } else {
                    device.torchMode = .Off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }


}

