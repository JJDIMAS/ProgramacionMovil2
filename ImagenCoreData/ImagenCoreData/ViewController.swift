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
        let arr = DataBaseHelper.instance.getAllImages()
        print(arr.count)
        if arr.count>0 {
            self.ImagenPerfil.image = UIImage(data: arr[0].img!)
        }
        

   }
    
    
    func getImage() -> [EntityImage]{
        let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let arrImage = [EntityImage]()
        let fetchRequest : NSFetchRequest<EntityImage> = EntityImage.fetchRequest()
        do {
            let result = try contexto.fetch(fetchRequest) as! [EntityImage]
        } catch let error{
            print(error.localizedDescription)
        }
        return arrImage
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
        
        //Antes de guardar, nos aseguramos de borrar los datos
        deleteData()
        
        if let jpg = self.ImagenPerfil.image?.jpegData(compressionQuality: 0.75){
            DataBaseHelper.instance.saveImageinCoreData(at: jpg)
            
            
        }
        
    }
    
    func deleteData() {
        let appDel:AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
        let context:NSManagedObjectContext = appDel.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "EntityImage")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for managedObject in results {
                if let managedObjectData: NSManagedObject = managedObject as? NSManagedObject {
                    context.delete(managedObjectData)
                }
            }
        } catch let error as NSError {
            print("Deleted all my data in myEntity error : \(error) \(error.userInfo)")
        }
    }}
