//Save image y get image son las conexiones

MÉTODO GUARDAR

if let jpg = self.ImagenPerfil.image?.jpegData(compressionQuality: 0.75){
	DataBaseHelper.instance.saveImageinCodeData(at: jpg)

}

//MÉTODO A LLAMAR VIEWLOAD
var arr = DataBaseHelper.instance.getAllImages()
self.ImagenPerfil.image = UIImage(data: arr[0].img!)

///////////////////////////////////////////////

import Foundation
impor UIKit
import CoreDate

DataBaseHelper{

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
	let fetchRequest : NSFetchRequest<NSFetchRequestResult>(entityName: "EntityImage")
	do{
		arrImage = try contexto.fetch(fetchRequest) as! [EntityImage]
	}catch let error{
		print(error.localizedDescription)
	}
	return arrImage
}

}