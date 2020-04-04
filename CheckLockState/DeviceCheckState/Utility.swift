//
//  Utility.swift
//  CheckLockState
//
//  Created by Amirreza Eghtedari on 16/1/1399AP.
//  Copyright © 1399 AP Amirreza Eghtedari. All rights reserved.
//

import UIKit

class Utility {
    
    class func checkDeviceLockState(completion: @escaping (DeviceLockState) -> Void) {
        
       DispatchQueue.main.async {
            if UIApplication.shared.isProtectedDataAvailable {
                completion(.unlocked)
            } else {
                completion(.locked)
            }
        }
    }
}
