//
//  ViewController.swift
//  ClimaApp
//
//  Created by Mac18 on 22/11/20.
//  Copyright © 2020 itm. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITextFieldDelegate, ClimaManagerDelegate, CLLocationManagerDelegate {
    func huboError(errorDescription: Error) {
        DispatchQueue.main.async {
            if(errorDescription.localizedDescription.contains("missing")){
                //print(errorDescription.localizedDescription)
                //Error de nombre en ciudad
                let aviso = UIAlertController(title: "Error", message: "La ciudad ingresada no existe", preferredStyle: .alert)
                let actionOk = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                aviso.addAction(actionOk)
                self.present(aviso, animated: true, completion: nil)
            }
        
            if(errorDescription.localizedDescription.contains("hostname")){
                //Error de nombre en ciudad
                let aviso = UIAlertController(title: "Error", message: "Ha ocurrido un error en el servidor", preferredStyle: .alert)
                let actionOk = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                aviso.addAction(actionOk)
                self.present(aviso, animated: true, completion: nil)
            }
            
        }

    }
    
    func actualizarClima(clima: ClimaModelo) {
        //print(clima.descripcionClima)
        DispatchQueue.main.async {
            self.temperaturaLabel.text = clima.temperaturaDecimal
            self.ciudadLabel.text = clima.nombreCiudad
            self.DescipcionLabel.text = clima.descripcionClima
            self.ClimaImageView.image = UIImage(named: clima.condicionClima[0])
            self.BackgroundImage.image = UIImage(named: clima.condicionClima[1])
            self.realFeelLabel.text = clima.realFeelTemp
            self.maxTempLabel.text = clima.maxTemp
            self.minTempLabel.text = clima.minTemp
            self.windSpeedLabel.text = clima.windSpeed
            
        }

        
    }
    
    
    
    var locationManager =  CLLocationManager()
    var climaManager = ClimaManager()
    @IBOutlet weak var ClimaImageView: UIImageView!
    @IBOutlet weak var BackgroundImage: UIImageView!
    @IBOutlet weak var temperaturaLabel: UILabel!
    @IBOutlet weak var ciudadLabel: UILabel!
    @IBOutlet weak var buscarTextField: UITextField!
    @IBOutlet weak var DescipcionLabel: UILabel!
    @IBOutlet weak var realFeelLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buscarTextField.delegate = self
        climaManager.delegado = self

        //locationManager.requestLocation()
    }
    //Boton de buscar
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ciudadLabel.text = buscarTextField.text
        climaManager.fetchClima(nombreCiudad: buscarTextField.text!)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if buscarTextField.text != "" {
            return true
        }else{
            //Aqui seria mejor poner una alerta
            buscarTextField.placeholder = "Busca una ciudad"
            return false
        }
    }
    
    @IBAction func BuscarButton(_ sender: UIButton) {
        print("BuscarButtonWorking")
        ciudadLabel.text = buscarTextField.text
        climaManager.fetchClima(nombreCiudad: buscarTextField.text!)
    }
    
    @IBAction func buscarUbicacion(_ sender: UIButton) {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let ubicaciones = locations.last{
            locationManager.stopUpdatingLocation()
            let lat = ubicaciones.coordinate.latitude
            let lon = ubicaciones.coordinate.longitude
            climaManager.fetchClima(lat: lat, lon: lon)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

