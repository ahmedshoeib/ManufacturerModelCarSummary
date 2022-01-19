//
//  Localization.swift
//  ManufacturerModelCarSummary
//
//  Created by Shoeib on 10/22/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

class Localization: NSObject {

    static func getStringByKey(key:String) -> String {
        return NSLocalizedString(key, comment: key);
    }
}
