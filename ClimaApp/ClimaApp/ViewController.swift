//
//  ViewController.swift
//  ClimaApp
//
//  Created by Mac18 on 22/11/20.
//  Copyright © 2020 itm. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var ClimaImageView: UIImageView!
    @IBOutlet weak var temperaturaLabel: UILabel!
    @IBOutlet weak var ciudadLabel: UILabel!
    @IBOutlet weak var buscarTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buscarTextField.delegate = self
    }
    //Boton de buscar
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ciudadLabel.text = buscarTextField.text
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
        ciudadLabel.text = buscarTextField.text
    }
    
}

