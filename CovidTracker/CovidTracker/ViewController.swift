//
//  ViewController.swift
//  CovidTracker
//
//  Created by Mac18 on 08/12/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, CovidManagerDelegate {
    var covidManager = CovidManager()
    
    func actualizarDatos(covid: CovidModel) {
        DispatchQueue.main.async {
            
            self.PaisLabel.text = covid.nombrePais
            self.CasosConfimadosLabel.text = String(covid.numeroCasos)
            self.DefuncionesConfirmadasLabel.text = String(covid.numeroMuertos)
            self.RecuperadosConfirmadosLabel.text = String(covid.numeroRecuperados)
            
            let url = URL(string: covid.bandera)
            let data = try? Data(contentsOf: url!)
            if let imageData = data{
                let image = UIImage(data: imageData)
                self.BanderaView.image = image
            }
        }
    }
    
    func huboError(errorDescription: Error) {
        DispatchQueue.main.async {
            let aviso = UIAlertController(title: "Error", message: "Hubo un error al procesar la solicitud", preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            aviso.addAction(actionOk)
            self.present(aviso, animated: true, completion: nil)

        }
    }
    

    @IBOutlet weak var PaisLabel: UILabel!
    @IBOutlet weak var RecuperadosConfirmadosLabel: UILabel!
    @IBOutlet weak var DefuncionesConfirmadasLabel: UILabel!
    @IBOutlet weak var nombrePaisTextField: UITextField!
    @IBOutlet weak var CasosConfimadosLabel: UILabel!
    @IBOutlet weak var BanderaView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nombrePaisTextField.delegate = self
        covidManager.delegado = self
        covidManager.fetchCovid(country: "mexico")
    }


    @IBAction func BuscarButton(_ sender: UIButton) {
        print(nombrePaisTextField.text!)
        covidManager.fetchCovid(country: nombrePaisTextField.text!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

