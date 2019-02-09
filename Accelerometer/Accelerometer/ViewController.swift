//
//  ViewController.swift
//  Accelerometer
//
//  Created by Sagar Sandy on 09/02/19.
//  Copyright © 2019 Sagar Sandy. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    var motionManager : CMMotionManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main) { (accelerometerData, error) in
            
            
            guard let accData = accelerometerData else { return }
            
            // Motion manager start accelerometer function will return the x,y and z axis value details whenever the phone is moved. So the output values will be printed for every minute motion of iPhone. Like for every small motion they will print 100000 of data values
            // eg:  x: 0.000001 y:0.00001 z:0.000001
            print("X Axis value is : \(accData.acceleration.x)")
            print("Y Axis value is : \(accData.acceleration.y)")
            print("Z Axis value is : \(accData.acceleration.z)")
            
            // To minimise the values returned by the acclerometer, we are using number formatter, which will set fraction value to our desired value.
            
            
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 1  // This wil return 0.1 or 0.2 like that
            formatter.maximumFractionDigits = 1
            
            
            let xAxisVale = formatter.string(for: accData.acceleration.x)!
            let yAxisVale = formatter.string(for: accData.acceleration.y)!
            let zAxisVale = formatter.string(for: accData.acceleration.z)!
            
            
            self.xLabel.text = "X : \(xAxisVale)"
            self.yLabel.text = "Y : \(yAxisVale)"
            self.zLabel.text = "Z : \(zAxisVale)"
            
            
        }
        
    }


}

