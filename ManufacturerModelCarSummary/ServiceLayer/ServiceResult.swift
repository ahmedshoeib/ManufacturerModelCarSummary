//
//  ServiceResult.swift
//  ManufacturerModelCarSummary
//
//  Created by Shoeib on 10/20/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation

enum Result<T:Decodable, E: Error> {
    case success(T)
    case failure(E)
}
