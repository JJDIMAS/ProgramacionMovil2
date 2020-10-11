//
//  ViewController.swift
//  minipoker
//
//  Created by Mac18 on 10/2/20.
//  Copyright © 2020 itm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let BackgroundImage = UIImageView()
    
    @IBOutlet weak var Carta1: UIImageView!
    @IBOutlet weak var Carta2: UIImageView!
    
    @IBOutlet weak var Carta3: UIImageView!
    @IBOutlet weak var Carta4: UIImageView!
    @IBOutlet weak var Carta5: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //La primera actividad al momento de arrancar
        SetBackground()
    }

    @IBAction func CambiarCarta(_ sender: UIButton) {
        //Cambiar la carta aleatoriamente pero no se pueden repetir
        //Creamos un set
        var numeros = Set<Int>()
        //Hasta que podamos meter n numeros en el set, dejamos de genera números aleatorios
        while numeros.count < 5{
           numeros.insert(Int.random(in: 0..<7 ))
        }
        //Guardamos los valores del set en un arreglo
        var valores = Array<Int>()
        for val in numeros{
            print(val)
            valores.append(val)
        }
        //Asignamos el valor a los imageview
        Carta1.image = [ #imageLiteral(resourceName: "F") , #imageLiteral(resourceName: "G"), #imageLiteral(resourceName: "C"), #imageLiteral(resourceName: "A"), #imageLiteral(resourceName: "D"), #imageLiteral(resourceName: "B"), #imageLiteral(resourceName: "I")][valores[0]]
        Carta2.image = [ #imageLiteral(resourceName: "F"), #imageLiteral(resourceName: "G") , #imageLiteral(resourceName: "C"), #imageLiteral(resourceName: "A"), #imageLiteral(resourceName: "D"), #imageLiteral(resourceName: "B"), #imageLiteral(resourceName: "I")][valores[1]]
        Carta3.image = [ #imageLiteral(resourceName: "F") , #imageLiteral(resourceName: "G") , #imageLiteral(resourceName: "C"), #imageLiteral(resourceName: "A"), #imageLiteral(resourceName: "D"), #imageLiteral(resourceName: "B"), #imageLiteral(resourceName: "H")][valores[2]]
        Carta4.image = [ #imageLiteral(resourceName: "F") , #imageLiteral(resourceName: "G") , #imageLiteral(resourceName: "C"), #imageLiteral(resourceName: "A"), #imageLiteral(resourceName: "D"), #imageLiteral(resourceName: "B"), #imageLiteral(resourceName: "I")][valores[3]]
        Carta5.image = [ #imageLiteral(resourceName: "F") , #imageLiteral(resourceName: "G") , #imageLiteral(resourceName: "C"), #imageLiteral(resourceName: "A"), #imageLiteral(resourceName: "D"), #imageLiteral(resourceName: "B"), #imageLiteral(resourceName: "I")][valores[4]]

    }
    func SetBackground(){
        view.addSubview(BackgroundImage)
        BackgroundImage.translatesAutoresizingMaskIntoConstraints = false
        BackgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        BackgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        BackgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        BackgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        BackgroundImage.image = UIImage(named: "Fondo")
        view.sendSubviewToBack(BackgroundImage)
    }
}
