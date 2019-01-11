//
//  File.swift
//  actividad2
//
//  Created by jos on 1/8/19.
//  Copyright © 2019 My Organization. All rights reserved.
//

import Foundation

class Contacto {
    
    var nombre: String
    var paterno: String
    var materno: String
    var fecha_nacimiento: String
    var edad: Int
    var ubicacion: String
    var parentesco: String
    
    init(nombre:String, paterno:String, materno:String, fechaNacimiento: String, edad: Int, ubicacion: String, parentesco: String) {
        self.nombre = nombre
        self.paterno = paterno
        self.materno = materno
        self.fecha_nacimiento = fechaNacimiento
        self.edad = edad
        self.ubicacion = ubicacion
        self.parentesco = parentesco
    }
}
