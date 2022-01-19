//
//  ManufactureListModel.swift
//  ManufacturerModelCarSummary
//
//  Created by Shoeib on 10/21/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation

struct ManufactureListModel : Decodable {
    let page: Int?
    let pageSize: Int?
    let totalPageCount: Int?
    let wkda: [String:String]?    
}
