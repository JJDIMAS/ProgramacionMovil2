//
//  ClimaData.swift
//  ClimaApp
//
//  Created by Mac18 on 23/11/20.
//  Copyright © 2020 itm. All rights reserved.
//

import Foundation
struct ClimaData: Codable {
    let name : String
    let cod : Int
    let main : Main
    let weather : [Weather]
    let coord : Coord
}
struct Main: Codable {
    let temp : Double
    let humidity : Int
}
struct Weather: Codable {
    let id : Int
    let description : String
}
struct Coord: Codable {
   let lat : Double
   let lon : Double
}
