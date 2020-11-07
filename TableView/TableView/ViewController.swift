//
//  ViewController.swift
//  TableView
//
//  Created by Mac4 on 26/10/20.
//  Copyright © 2020 Mac4. All rights reserved.
//

import UIKit
//Implitamos dos protocolos DELEGATE Y DATASOURCE
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let defaults = UserDefaults.standard //Guarda los datos actuales, como el
    var textfield = UITextField() //Guardar nombre del alumno
    var Alumnos = ["José", "María", "Morelos", "Y", "Pavón"]
    var AlumnoSeleccionado : String?

    

    @IBOutlet weak var Tabla: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Registramos la celda personalizada
        Tabla.register(UINib(nibName: "AlumnoCell", bundle: nil), forCellReuseIdentifier: "celda")
        
        
        //Implementar delegados
        Tabla.delegate = self
        Tabla.dataSource = self
        
        if let alumnosGuardados = defaults.array(forKey: "AlumosProgra") as? [String]{
            //optional binding
            Alumnos = alumnosGuardados
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Alumnos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Crear un objeto del tipo UITableViewCell
        //La siguiente linea es cuando no tenemos una estilo definido de la celda
        //let ObjCelda = UITableViewCell(style: .default, reuseIdentifier: "celda")
        
        //Crear un objeto para las celdas personalizadas
        let ObjCelda = Tabla.dequeueReusableCell(withIdentifier: "celda") as! AlumnoCell
        //Modificar el texto de los renglones
        ObjCelda.alumnoLabel.text = Alumnos[indexPath.row]
        return ObjCelda
    }
    
    //Cuando el usuario selecciona un elemento
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AlumnoSeleccionado = Alumnos[indexPath.row]
        performSegue(withIdentifier: "EnviarNombre", sender: AlumnoSeleccionado)
    }
    
    //Añadir boton de eliminar
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //Eliminar el elemento
            Alumnos.remove(at: indexPath.row)
            //Lo guarda en el archivo default
            self.defaults.set(self.Alumnos, forKey: "AlumnosProgra")
            Tabla.reloadData()
        }
     
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EnviarNombre"{
            let destino = segue.destination as! InicioViewController
            destino.recibirAlumno = AlumnoSeleccionado
        }
    }
    
    @IBAction func AddAlumno(_ sender: UIBarButtonItem) {
    let alerta = UIAlertController(title: "Agregar Nuevo", message: "Ingresar nuevo alumno", preferredStyle: .alert)
        let actionAceptar = UIAlertAction(title: "Aceptar", style: .default) { (_) in
            //print("Usuario agregado")
            if self.textfield.text == ""{
                print("Necesitas agregar un alumno")
            }else{
                //Lo guarda en el archivo default
                self.defaults.set(self.Alumnos, forKey: "AlumnosProgra")
                
                self.Alumnos.append(self.textfield.text!)
                self.Tabla.reloadData()
            }

        }
        let actionCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        alerta.addAction(actionAceptar)
        alerta.addAction(actionCancelar)
        //Agregar el textfield
        alerta.addTextField { (AlertaTextField) in
            AlertaTextField.placeholder = "Nombre del alumno"
            self.textfield = AlertaTextField
        }
        
        present(alerta, animated: true, completion: nil)
    }
}

