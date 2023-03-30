//
//  ApiResponse.swift
//  Stoks
//
//  Created by Nathan Getachew on 3/29/23.
//

import Foundation

public struct ApiResponse: Codable {
    let count : Int
    let entries : [Api]
}

public struct Api: Codable {
    let API : String
    let Description : String
    let Auth : String
    let HTTPS : Bool
    let Cors : String
    let Link : String
    let Category : String
}
