//
//  InicioViewController.swift
//  TableView
//
//  Created by Mac4 on 26/10/20.
//  Copyright © 2020 Mac4. All rights reserved.
//

import UIKit

class InicioViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var promedio : Float?
    var recibirAlumno : String?
    @IBOutlet weak var imagenPerfil: UIImageView!
    @IBOutlet weak var NombreAlumnoLabel: UILabel!
    @IBOutlet weak var promedioLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        NombreAlumnoLabel.text = "Bienvenido(a) \(recibirAlumno!)"
    }
    
    @IBAction func mandarDatos(_ sender: UIButton) {
        //performSegue(withIdentifier: "AlumnoToCalificacion", sender: promedio)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AlumnoToCalificacion"{
            let destino = segue.destination as! CalificacionViewController
            destino.promedio = promedio
        }
    }
    
    @IBAction func cambiarPromedio(_ sender: UISlider) {
        promedio = sender.value
        promedioLabel.text = "\(String(format: "%.2f", promedio!)) pts"
    }
    
    @IBAction func elegirFoto(_ sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    //MARK:- Métodos de los delegados para el pickerController
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info)
        let imagen = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage
        imagenPerfil.image = imagen
        picker.dismiss(animated: true, completion: nil)
    }

}
