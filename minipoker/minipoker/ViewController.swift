//
//  ViewController.swift
//  minipoker
//
//  Created by Mac18 on 10/2/20.
//  Copyright © 2020 itm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var Carta1: UIImageView!
    @IBOutlet weak var Carta2: UIImageView!
    @IBOutlet weak var Carta3: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //La primera actividad al momento de arrancar
    }

    @IBAction func CambiarCarta(_ sender: UIButton) {
        print("Cambiando carta")
    }
}

