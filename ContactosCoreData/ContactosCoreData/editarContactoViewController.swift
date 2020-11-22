//
//  editarContactoViewController.swift
//  ContactosCoreData
//
//  Created by Mac18 on 16/11/20.
//  Copyright © 2020 itm. All rights reserved.
//

import UIKit
import CoreData

class editarContactoViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var Contactos = [Contacto]()
    var recibirNombre : String?
    var recibirTelefono : String?
    var recibirDireccion : String?
    var recibirIndex : Int?
    var recibirImagen : UIImage?
    
    
    let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var ImagenPerfil: UIImageView!
    @IBOutlet weak var direccionContacto: UITextField!
    @IBOutlet weak var telefonoContacto: UITextField!
    @IBOutlet weak var nombreContacto: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarInfoCoreData()
        
        nombreContacto.text = recibirNombre
        telefonoContacto.text = recibirTelefono
        direccionContacto.text = recibirDireccion
        ImagenPerfil.image = recibirImagen
    }
    
    @IBAction func agregarImagen(_ sender: UIButton) {
        //Se cambiar la imagen, ya luego lo añadimos al guardar contacto.
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imagen = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage
        ImagenPerfil.image = imagen
        picker.dismiss(animated: true, completion: nil)
        
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
        let alerta = UIAlertController(title: "Confirmación", message: "¿Realmente desea guardar los cambios?", preferredStyle: .alert)
        let actioncancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        let actionAceptar = UIAlertAction(title: "Aceptar", style: .default) { (_) in
            
           self.Contactos[self.recibirIndex!].setValue(self.nombreContacto.text, forKey: "nombre")
        self.Contactos[self.recibirIndex!].setValue(Int64(self.telefonoContacto.text!), forKey: "telefono")
            self.Contactos[self.recibirIndex!].setValue(self.direccionContacto.text, forKey: "direccion")
            
            if let jpg = self.ImagenPerfil.image?.jpegData(compressionQuality: 0.75){
                self.Contactos[self.recibirIndex!].setValue(jpg, forKey: "foto")
            }
            self.guardarContacto()
            self.navigationController?.popViewController(animated: true)
        }
        alerta.addAction(actionAceptar)
        alerta.addAction(actioncancelar)
        present(alerta, animated: true, completion: nil)
        

        
    }
   
    @IBAction func cancelarButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
