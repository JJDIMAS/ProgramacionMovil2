//
//  ClimaManager.swift
//  ClimaApp
//
//  Created by Mac18 on 22/11/20.
//  Copyright © 2020 itm. All rights reserved.
//

import Foundation

struct ClimaManager {
    let climaURL = "http://api.openweathermap.org/data/2.5/weather?apid=70b3aadd65957aeac7242719dc0b4fe1&units=metric"
    
    func fetchClima(nombreCiudad: String){
        let urlString = "\(climaURL)&q=\(nombreCiudad)"
        print(urlString)
    realizarSolicitud(urlString: urlString)
    }
    
    func realizarSolicitud(urlString : String){
        //Crear URL
        if let url = URL(string: urlString){
            //crear el objeto URLSession
            let session = URLSession(configuration: .default)
            //asignar una tarea
            //let tarea = session.dataTask(with: url, completionHandler: handle(data:respuesta:error))
            //tarea.resume()
        }
        
    }
    func handle(data: Data?, respuesta: URLResponse?, error: Error?){
        if error != nil {
            print(error)
            return
        }
    }
    
}
