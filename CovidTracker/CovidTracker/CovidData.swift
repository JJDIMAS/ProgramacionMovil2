//
//  CovidData.swift
//  CovidTracker
//
//  Created by Mac18 on 12/12/20.
//

import Foundation
struct CovidData : Codable {
    let country : String
    let cases : Int
    let deaths : Int
    let recovered : Int
    let countryInfo : CountryInfo
}

struct CountryInfo : Codable {
    let flag : String
}
