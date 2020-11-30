//
//  ViewController.swift
//  ClimaApp
//
//  Created by Mac18 on 22/11/20.
//  Copyright © 2020 itm. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, ClimaManagerDelegate {
    func huboError(errorDescription: Error) {
        DispatchQueue.main.async {
            if(errorDescription.localizedDescription.contains("missing")){
                //Error de nombre en ciudad
                let aviso = UIAlertController(title: "Error", message: "La ciudad ingresada no existe", preferredStyle: .alert)
                let actionOk = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                aviso.addAction(actionOk)
                self.present(aviso, animated: true, completion: nil)            }
        }

    }
    
    func actualizarClima(clima: ClimaModelo) {
        //print(clima.descripcionClima)
        DispatchQueue.main.async {
            self.temperaturaLabel.text = clima.temperaturaDecimal
            self.ciudadLabel.text = clima.nombreCiudad
            self.DescipcionLabel.text = clima.descripcionClima
            self.ClimaImageView.image = UIImage(named: clima.condicionClima[0])
            
        }

        
    }
    
    
    
    
    var climaManager = ClimaManager()
    @IBOutlet weak var ClimaImageView: UIImageView!
    @IBOutlet weak var temperaturaLabel: UILabel!
    @IBOutlet weak var ciudadLabel: UILabel!
    @IBOutlet weak var buscarTextField: UITextField!
    @IBOutlet weak var DescipcionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buscarTextField.delegate = self
        climaManager.delegado = self
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

