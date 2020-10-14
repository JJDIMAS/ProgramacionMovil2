//: A Cocoa based Playground to present user interface

import AppKit
import PlaygroundSupport

struct Universidad {
    var nombre : String
    var numAlumnos : Int
    var carreras : [String]
    var alumnos : [Int: String]
    
    //contructor
    init(nombre: String, numAlumnos: Int, ofertaAcademica: [String], estudiantes: [Int: String]) {
        self.nombre = nombre
        self.numAlumnos = numAlumnos
        carreras = ofertaAcademica
        alumnos = estudiantes
    }
    
    mutating func ClasesOnline(){
        print("Clases online")
        numAlumnos = 6200
        nombre = "Tec Morelia"
    }
}

var itm = Universidad(nombre: "ITM", numAlumnos: 6000, ofertaAcademica: ["Sistemas","Bioquimica","Admin"], estudiantes: [11145678: "Arturo"])


itm.alumnos

var unid = Universidad(nombre: "Unid", numAlumnos: 400, ofertaAcademica: ["Admin"], estudiantes: [202019: "Ana"])

unid.nombre


// funciones
func saludo() {
    print("Hola a todos")
}

//retorna 1 valor y recibe 2 parametros
func suma(n1: Double, n2: Double) ->  Double {
    let resultado = (n1 + n2) - 5.0
    return resultado
}

print(suma(n1: 13.5, n2: 17.5))

//reciba 1 array como parametro y retorne 2 valores
func minMax(calificaciones:[Int]) -> (min: Int, max: Int) {
    var minimo = calificaciones[0]
    var maximo = calificaciones[0]
    
    for i in calificaciones {
        if i < minimo {
            minimo = i
        } else if i > maximo {
            maximo = i
        } // else if
    } // for
    
    return (minimo, maximo)
}

let calificacion = [90,86,67,100,95]

let calificaionesMinMAx = minMax(calificaciones: calificacion)

print("La calificacion minima es : \(calificaionesMinMAx.min) y la calificacion maxima es :\(calificaionesMinMAx.max)")

