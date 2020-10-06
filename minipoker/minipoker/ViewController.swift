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
        //Carta1.image = #imageLiteral(resourceName: "poker-playing-card-6-diamond-miroslav-nemecek-transparent")
    }

    @IBAction func CambiarCarta(_ sender: UIButton) {
        //Cambiar la carta aleatoriamente pero no se pueden repetir
        //Creamos un set
        var numeros = Set<Int>()
        //Hasta que podamos meter n numeros en el set, dejamos de genera números aleatorios
        while numeros.count < 3{
           numeros.insert(Int.random(in: 0..<3 ))
        }
        //Guardamos los valores del set en un arreglo
        var valores = Array<Int>()
        for val in numeros{
            print(val)
            valores.append(val)
        }
        //Asignamos el valor a los imageview
        Carta1.image = [ #imageLiteral(resourceName: "poker-playing-card-2-club-vector-8695867") , #imageLiteral(resourceName: "poker-playing-card-6-diamond-miroslav-nemecek-transparent"), #imageLiteral(resourceName: "poker-playing-card-9-heart-vector-8696744")][valores[0]]
        Carta2.image = [ #imageLiteral(resourceName: "poker-playing-card-2-club-vector-8695867"), #imageLiteral(resourceName: "poker-playing-card-6-diamond-miroslav-nemecek-transparent") , #imageLiteral(resourceName: "poker-playing-card-9-heart-vector-8696744")][valores[1]]
        Carta3.image = [ #imageLiteral(resourceName: "poker-playing-card-2-club-vector-8695867") , #imageLiteral(resourceName: "poker-playing-card-6-diamond-miroslav-nemecek-transparent") , #imageLiteral(resourceName: "poker-playing-card-9-heart-vector-8696744")][valores[2]]
        
    }
}
