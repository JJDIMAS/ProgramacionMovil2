//
//  ViewController.swift
//  ContactosCoreData
//
//  Created by Mac18 on 13/11/20.
//  Copyright © 2020 itm. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var Contactos = [Contacto]()
    var nombreContacto : String?
    var telefonoContacto: String?
    var direccionContacto: String?
    var index: Int?
    
    @IBOutlet weak var tablaContactos: UITableView!
    
    let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarInfoCoreData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         self.tablaContactos.reloadData()
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
    
    @IBAction func agregarContacto(_ sender: UIBarButtonItem) {
        let alerta = UIAlertController(title: "Agregar Contacto", message: "Nuevo contaco", preferredStyle: .alert)
        alerta.addTextField{
            (nombreAlert) in nombreAlert.placeholder = "Nombre"
        }
        alerta.addTextField{
            (telefonoAlert) in telefonoAlert.placeholder = "Telefono"
        }
        alerta.addTextField{
            (direccionAlert) in direccionAlert.placeholder = "Direccion"
        }
        
        let actionAceptar = UIAlertAction(title: "Aceptar", style: .default) { (_) in
            print("Agregar elemento")
            //Variables para guardar la información en el struct
            guard let nombreAlert = alerta.textFields?.first?.text else {return}
            guard let telefonoAlert = alerta.textFields?[1].text else {return}
            guard let direccionAlert = alerta.textFields?.last?.text else {return}
            
            //Guardando en la base de datos
           
            //let entidadContacto = NSEntityDescription.insertNewObject(forEntityName: "Contacto", into: self.contexto) as! Contacto
            let nuevoContacto = Contacto(context: self.contexto)
            
            nuevoContacto.nombre = nombreAlert
            nuevoContacto.telefono = Int64(telefonoAlert) ?? 0
            nuevoContacto.direccion = direccionAlert
            self.guardarContacto()
            self.Contactos.append(nuevoContacto)
            self.tablaContactos.reloadData()
            
            }
        let actionCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        alerta.addAction(actionCancelar)
        alerta.addAction(actionAceptar)
        present(alerta, animated: true, completion: nil)
            
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
    
    
}
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Contactos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaContactos.dequeueReusableCell(withIdentifier: "celda", for: indexPath);
        celda.textLabel?.text = Contactos[indexPath.row].nombre
        celda.detailTextLabel?.text = String(Contactos[indexPath.row].telefono ?? 0)
        return celda;
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contexto.delete(Contactos[indexPath.row])
            Contactos.remove(at: indexPath.row)
            self.guardarContacto()
        }
        tablaContactos.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        nombreContacto = Contactos[indexPath.row].nombre
        telefonoContacto = String(Contactos[indexPath.row].telefono)
        direccionContacto = Contactos[indexPath.row].direccion
        index = indexPath.row
        performSegue(withIdentifier: "editarContacto", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editarContacto" {
            let ObjContacto = segue.destination as! editarContactoViewController
            ObjContacto.recibirNombre = nombreContacto
            ObjContacto.recibirTelefono = telefonoContacto
            ObjContacto.recibirDireccion = direccionContacto
            ObjContacto.recibirIndex = index
        }
    }
    
}
