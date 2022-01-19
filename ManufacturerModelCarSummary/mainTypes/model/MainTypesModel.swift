//
//  MainTypesModel.swift
//  ManufacturerModelCarSummary
//
//  Created by Shoeib on 10/22/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation

struct MainTypesModel : Decodable {
    let page: Int
    let pageSize: Int
    let totalPageCount: Int
    let wkda: [String:String]
}
