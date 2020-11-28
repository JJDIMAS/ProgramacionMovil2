//
//  ClimaManager.swift
//  ClimaApp
//
//  Created by Mac18 on 22/11/20.
//  Copyright © 2020 itm. All rights reserved.
//

import Foundation

struct ClimaManager {
    //let climaURL = "https://api.openweathermap.org/data/2.5/weather?apid=70b3aadd65957aeac7242719dc0b4fe1&units=metric&lang=es"
    let climaURL = "https://api.openweathermap.org/data/2.5/weather?appid=d6b4dd6466869a2e4f8e11759a67cd75&units=metric&lan=es"
    
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
            //let tarea = session.dataTask(with: url, completionHandler: handle(data:respuesta:error:))
            let tarea = session.dataTask(with: url){
                (data, respuesta,error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let DatosSeguros = data {
                    //Decodificar el obj JSON de la API
                    self.parseJSON(climaData: DatosSeguros)
                }
            }
            tarea.resume()
        }
    }
    func parseJSON(climaData: Data){
        let decoder = JSONDecoder()
        
        do {
            let dataDecodificada = try decoder.decode(ClimaData.self, from: climaData)
            
            print(dataDecodificada.name)
            print(dataDecodificada.cod)
            print(dataDecodificada.main.humidity)
            print(dataDecodificada.main.temp)
            print(dataDecodificada.weather[0].description)
        
        } catch  {
            print(error)
        }
        
    }
}
