//
//  InicioViewController.swift
//  TableView
//
//  Created by Mac4 on 26/10/20.
//  Copyright © 2020 Mac4. All rights reserved.
//

import UIKit

class InicioViewController: UIViewController {

    var recibirAlumno : String?
    @IBOutlet weak var NombreAlumnoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NombreAlumnoLabel.text = recibirAlumno!
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
