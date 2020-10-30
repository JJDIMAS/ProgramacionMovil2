//
//  CalificacionViewController.swift
//  TableView
//
//  Created by Mac4 on 30/10/20.
//  Copyright © 2020 Mac4. All rights reserved.
//

import UIKit

class CalificacionViewController: UIViewController {

    var promedio : Float?
    @IBOutlet weak var vista: UIView!
    @IBOutlet weak var anuncioLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if (promedio! >= 70.00){
            //Alumno aprobado
            //Cambiamos la etiqueta
            anuncioLabel.text = "Felicidades. Has aprobado con \(promedio!)"
            //Cambiamos el color de fondo
            self.vista.backgroundColor = UIColor(red: 77/255, green: 182/255, blue: 87/255, alpha: 1)
            //imagen de vista
            iconView.image = UIImage(named: "sol")
        }else{
            //Alumno no aprobado
            //Cambiamos la etiqueta
            anuncioLabel.text = "Lo sentimos. Has reprobado"
            //Cambiamos el color de fondo
            vista.backgroundColor = .red
            //imagen de vista
            iconView.image = UIImage(named: "triste")
            
        }
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
