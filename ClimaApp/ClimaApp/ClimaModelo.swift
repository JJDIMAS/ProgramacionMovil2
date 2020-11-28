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
    var condicionClima: String {
        switch condicionID {
        case 200...232:
            //Retornamos el nombre de la imagen, agregamos los casos que sean necesarios
            return "cloud_7"
        case 300...321:
            return "cloud_6"
        case 500...531:
            return "cloud_10"
        case 600...622:
            return "snow"
        case 701...781:
            return "cloud_8"
        case 801...804:
            return "cloud_11"
        default:
            return "cloud"
        }
    }
}
