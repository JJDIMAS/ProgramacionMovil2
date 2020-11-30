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
    
    //Crear propiedad computada
    var condicionClima: [String] {
        switch condicionID {
        case 200...232:
            //Retornamos el nombre de la imagen, agregamos los casos que sean necesarios
            return ["cloud_7","tormenta_3"]
        case 300...321:
            return ["cloud_6","llovizna"]
        case 500...531:
            return ["cloud_10","llovizna_2"]
        case 600...622:
            return ["snow","snowc_2"]
        case 701...781:
            return ["cloud_8","volcano_2"]
        case 801...804:
            return ["cloud_11","nublado_3"]
        default:
            return ["cloud","sunny"]
        }
    }
    var temperaturaDecimal: String{
        return String(format: "%.1f", temperaturaCelcius)
    }
}
