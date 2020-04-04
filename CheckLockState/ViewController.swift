//
//  ViewController.swift
//  CheckLockState
//
//  Created by Amirreza Eghtedari on 16/1/1399AP.
//  Copyright © 1399 AP Amirreza Eghtedari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var backgroundTaskID: UIBackgroundTaskIdentifier!
    
    @IBAction func actionButtonTapped(_ sender: Any) {
        backgroundTaskID = UIApplication.shared.beginBackgroundTask()
        DispatchQueue.global().asyncAfter(deadline: .now() + 15) {[weak self] in
            Utility.checkDeviceLockState() {
                lockState in
                if let self = self {
                    self.showPhoneState(lockState)
                    UIApplication.shared.endBackgroundTask(self.backgroundTaskID)
                }
            }
        }
    }
    
    func showPhoneState(_ deviceLockState: DeviceLockState) {
        switch deviceLockState {
        case .locked:
            print("locked")
        case .unlocked:
            print("Unlocked")
        }
    }

}

