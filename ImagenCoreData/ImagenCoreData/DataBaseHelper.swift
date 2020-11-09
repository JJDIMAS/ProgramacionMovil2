//
//  DataBaseHelper.swift
//  ImagenCoreData
//
//  Created by Mac18 on 08/11/20.
//  Copyright © 2020 itm. All rights reserved.
//
import Foundation
import UIKit
import CoreData

class DataBaseHelper{
    
static let instance = DataBaseHelper()
    let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveImageinCoreData(at imgData: Data){
        let entityImage = NSEntityDescription.insertNewObject(forEntityName: "EntityImage", into: contexto) as!  EntityImage
        entityImage.img = imgData
        do{
            try contexto.save()
        }catch let error{
            print(error.localizedDescription)
        }
        
    }
    func getAllImages()->[EntityImage]{
        var arrImage = [EntityImage]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "EntityImage")
        do{
            arrImage = try contexto.fetch(fetchRequest) as! [EntityImage]
        }catch let error{
            print(error.localizedDescription)
        }
        return arrImage
    }
    
}
