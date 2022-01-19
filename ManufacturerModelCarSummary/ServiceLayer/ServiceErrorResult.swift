//
//  ServiceErrorResult.swift
//  ManufacturerModelCarSummary
//
//  Created by Shoeib on 10/20/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation

enum ErrorResult: Error {
    case network(message: String)
    case parser(message: String)
    case error(message: String)
    case empty(message: String)
    case serviceError(serviceError: MainError)
}
