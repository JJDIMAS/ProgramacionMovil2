//
//  CovidManager.swift
//  CovidTracker
//
//  Created by Mac18 on 12/12/20.
//

import Foundation

protocol ClimaManagerDelegate {
   func actualizarDatos(covid: covidModel)
   func huboError(errorDescription: Error)
}

struct CovidManager{
    let CovidUrl = "https://corona.lmao.ninja/v3/covid-19/countries/"
    var delegado : ClimaManagerDelegate?
    
    func fetchCovid(country: String){
        let urlString = "\(CovidUrl)/\(country)"
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
                    //print(error!)
                    self.delegado?.huboError(errorDescription: error!)
                    return
                }
                if let DatosSeguros = data {
                    //Decodificar el obj JSON de la API
                    //self.parseJSON(climaData: DatosSeguros)
                   
                    // if let clima = self.parseJSON(climaData: DatosSeguros){
                     //   self.delegado?.actualizarClima(clima: clima)
                   // }
                }
            }
            tarea.resume()
        }
    }
    
}
