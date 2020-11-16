//
//  editarContactoViewController.swift
//  ContactosCoreData
//
//  Created by Mac18 on 16/11/20.
//  Copyright © 2020 itm. All rights reserved.
//

import UIKit

class editarContactoViewController: UIViewController {

    var recibirNombre : String?
    @IBOutlet weak var direccionContacto: UITextField!
    @IBOutlet weak var telefonoContacto: UITextField!
    @IBOutlet weak var nombreContacto: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nombreContacto.text = recibirNombre
    }

    @IBAction func guardarContactoButton(_ sender: UIButton) {
    }
   
    @IBAction func cancelarButton(_ sender: UIButton) {
    }
}
