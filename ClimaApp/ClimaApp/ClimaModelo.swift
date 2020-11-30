//
//  ClimaModelo.swift
//  ClimaApp
//
//  Created by Mac18 on 24/11/20.
//  Copyright © 2020 itm. All rights reserved.
//

import Foundation
struct ClimaModelo {
    let condicionID : Int
    let nombreCiudad: String
    let descripcionClima: String
    let temperaturaCelcius: Double
    let realFeel : Double
    let max : Double
    let min : Double
    let speed : Double
    
    //Crear propiedad computada
    var condicionClima: [String] {
        switch condicionID {
        case 200...232:
            //Retornamos el nombre de la imagen, agregamos los casos que sean necesarios
            return ["cloud_7b","tormenta_3"]
        case 300...321:
            return ["cloud_6b","llovizna"]
        case 500...531:
            return ["cloud_10b","llovizna_2"]
        case 600...622:
            return ["snowb","snowc_2"]
        case 701...781:
            return ["cloud_8b","volcano_2"]
        case 801...804:
            return ["cloud_11b","nublado_3"]
        default:
            return ["cloudb","sunny"]
        }
    }
    var temperaturaDecimal: String{
        return String(format: "%.1f", temperaturaCelcius)
    }
    var realFeelTemp: String{
        return String(format: "%.1f", realFeel)
    }
    var maxTemp: String{
        return String(format: "%.1f", max)
    }
    var minTemp: String{
        return String(format: "%.1f", min)
    }
    var windSpeed: String{
        return String(format: "%.1f", speed)
    }}
