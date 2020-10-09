//
//  APViewController.swift
//  minipoker
//
//  Created by Mac18 on 10/7/20.
//  Copyright © 2020 itm. All rights reserved.
//

import UIKit

class APViewController: UIViewController {
    
    var nombre: String?
    var cantidad: Float?
    
    @IBOutlet weak var Nombre: UITextField!
    
    @IBOutlet weak var Cantidad: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ApostarButton(_ sender: UIButton) {
        nombre = Nombre.text
        cantidad = Float(Cantidad.text!)
        let impuesto = cantidad! * 0.16
        
        //print(nombre ?? "No hay valor")
        //print(cantidad!-impuesto)
        
        let alert = UIAlertController(title: "Hola \(String(nombre!))", message: "Tu apuesta menos impuestos es de: $\(cantidad!-impuesto). ¿Deseas continuar?", preferredStyle: .alert)
        
        //alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                self.dismiss(animated: true, completion: nil)            }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
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
