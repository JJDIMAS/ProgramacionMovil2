//
//  Usuario.swift
//  EnviarDatos
//
//  Created by Mac4 on 25/10/20.
//  Copyright © 2020 Mac4. All rights reserved.
//

import UIKit

class Usuario: UIViewController {

    
    //String para recibir el valor del input
    var Nombre : String = ""
    
    @IBOutlet weak var NombreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NombreLabel.text = "Bienvenido \(Nombre)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
