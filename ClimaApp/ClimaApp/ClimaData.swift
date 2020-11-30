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
    let wind : Wind
}
struct Main: Codable {
    let temp : Double
    let realFeel: Double
    let max: Double
    let min: Double
    let humidity : Int
}
struct Weather: Codable {
    let id : Int
    let description : String
}
struct Wind: Codable {
    let speed: Double
}
struct Coord: Codable {
   let lat : Double
   let lon : Double
}
