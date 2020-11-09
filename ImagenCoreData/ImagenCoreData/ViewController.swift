//
//  ViewController.swift
//  ImagenCoreData
//
//  Created by Mac18 on 06/11/20.
//  Copyright © 2020 itm. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var ImagenPerfil: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest : NSFetchRequest<EntityImage> = EntityImage.fetchRequest()
        
        do {
            let result = try contexto.fetch(fetchRequest)
            print(result)
        } catch let error as NSError {
            print("Error al cargar la imagen de BD")
        }
    }

    @IBAction func elegirFoto(_ sender: UIButton) {
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
    
    @IBAction func GuardarImagen(_ sender: UIButton) {
        //Nos conectamos a la base de datos
        let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let imageData = ImagenPerfil.image?.pngData()
        //guard UIImage(data: imageData!) != nil else {return}
        //image = Image(foto: foto)
        //let imageInstance = Image(context: contexto)
        //imageInstance.img = imageData
        let TablaImagen = NSEntityDescription.insertNewObject(forEntityName: "EntityImage", into: contexto) as!  EntityImage
        TablaImagen.img = imageData
        do {
            try contexto.save()
            print("Imagen guardada")
        } catch {
            print(error.localizedDescription)
        }
    }
}
