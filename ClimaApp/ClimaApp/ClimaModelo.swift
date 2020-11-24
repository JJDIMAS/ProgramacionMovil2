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
            return ""
        default:
            <#code#>
        }
    }
}
