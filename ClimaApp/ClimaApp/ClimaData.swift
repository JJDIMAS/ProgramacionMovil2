//
//  ClimaData.swift
//  ClimaApp
//
//  Created by Mac18 on 23/11/20.
//  Copyright © 2020 itm. All rights reserved.
//

import Foundation
struct ClimaData: Decodable {
    let name : String
    let cod : Int
    let main : Main
    let weather : [Weather]
    let coord : Coord
}
struct Main: Decodable {
    let temp: Double
    let humidity: Int
}
struct Weather: Decodable {
    let description: String
}
struct Coord: Decodable {
   let lat : Double
   let lon : Double
}
