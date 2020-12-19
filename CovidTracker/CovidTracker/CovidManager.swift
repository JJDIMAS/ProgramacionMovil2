//
//  CovidManager.swift
//  CovidTracker
//
//  Created by Mac18 on 12/12/20.
//

import Foundation

protocol CovidManagerDelegate {
   func actualizarDatos(covid: CovidModel)
   func huboError(errorDescription: Error)
}

struct CovidManager{
    let CovidUrl = "https://corona.lmao.ninja/v3/covid-19/countries"
    var delegado : CovidManagerDelegate?
    
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
                   
                    if let covid_v = self.parseJSON(covidData: DatosSeguros){
                        self.delegado?.actualizarDatos(covid: covid_v)
                    }
                }
            }
            tarea.resume()
        }
    }

    func parseJSON(covidData: Data) -> CovidModel?{
        let decoder  = JSONDecoder()
        do{
       let dataDecodificada = try decoder.decode(CovidData.self, from: covidData)
           
            let Pais = dataDecodificada.country
            let Activos = dataDecodificada.cases
            let Muertes = dataDecodificada.deaths
            let Recuperados = dataDecodificada.recovered
            let Bandera = dataDecodificada.countryInfo.flag
            
            // crear el objeto personalizado
            let ObjetoCovid = CovidModel(numeroCasos: Activos, numeroMuertos: Muertes, numeroRecuperados: Recuperados, bandera: Bandera, nombrePais: Pais)
            return ObjetoCovid
        }catch{
            self.delegado?.huboError(errorDescription: error)
            //print(error)
            return nil
        }
    }
}
