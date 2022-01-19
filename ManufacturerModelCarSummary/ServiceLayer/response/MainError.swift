//
//  MainError.swift
//  ManufacturerModelCarSummary
//
//  Created by Shoeib on 10/20/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation

struct MainError : Decodable {
    
    var timestamp: String?
    var status: Int?
    var error: String?
    var message: String?
    var path: String?

    
}
