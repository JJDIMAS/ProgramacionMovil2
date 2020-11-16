//
//  editarContactoViewController.swift
//  ContactosCoreData
//
//  Created by Mac18 on 16/11/20.
//  Copyright © 2020 itm. All rights reserved.
//

import UIKit
import CoreData

class editarContactoViewController: UIViewController {
    
    var Contactos = [Contacto]()
    var recibirNombre : String?
    var recibirTelefono : String?
    var recibirDireccion : String?
    var recibirIndex : Int?
    
    let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var direccionContacto: UITextField!
    @IBOutlet weak var telefonoContacto: UITextField!
    @IBOutlet weak var nombreContacto: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarInfoCoreData()
        
        nombreContacto.text = recibirNombre
        telefonoContacto.text = recibirTelefono
        direccionContacto.text = recibirDireccion
    }
    
    func guardarContacto(){
        do{
            try self.contexto.save()
            print("Almacenamiento correcto")
            //self.cargarInfoCoreData()
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
    func cargarInfoCoreData(){
        let fetchRequest : NSFetchRequest <Contacto> = Contacto.fetchRequest()
        do{
            Contactos = try contexto.fetch(fetchRequest)
            
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func guardarContactoButton(_ sender: UIButton) {
    
        Contactos[recibirIndex!].setValue(nombreContacto.text, forKey: "nombre")
        Contactos[recibirIndex!].setValue(Int64(telefonoContacto.text!), forKey: "telefono")
        Contactos[recibirIndex!].setValue(direccionContacto.text, forKey: "direccion")
        guardarContacto()
    }
   
    @IBAction func cancelarButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
