//
//  ViewController.swift
//  EnviarDatos
//
//  Created by Mac4 on 25/10/20.
//  Copyright © 2020 Mac4. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var NombreInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func EnviarNombre(_ sender: UIButton) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EnviarUsuario"{
            //Crear un objeto de usuario para manipular los datos
            let destino = segue.destination as! Usuario
            //Cambiar el atributo nombre con el valor de textfield
           destino.Nombre = NombreInput.text ?? ""
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

