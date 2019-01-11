//
//  DetalleVC.swift
//  actividad2
//
//  Created by jos on 1/9/19.
//  Copyright © 2019 My Organization. All rights reserved.
//

import UIKit

class DetalleVC: UIViewController {
    
    var nombre: String?
    var paterno: String?
    var materno: String?
    var fechaNacimiento:String?
    var edad: Int?
    var ubicacion: String?
    
    @IBOutlet weak var nombreCompletoLbl: UILabel!
    @IBOutlet weak var fechaNacimientoLbl: UILabel!
    @IBOutlet weak var edadLbl: UILabel!
    @IBOutlet weak var ubicacionLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombreCompletoLbl.text = "Nombre: \(nombre!) \(paterno!) \(materno!)"
        fechaNacimientoLbl.text = "Fecha Nacimiento: \(fechaNacimiento!)"
        edadLbl.text = "Edad: \(edad!)"
        ubicacionLbl.text = "Ubicacion: \(ubicacion!)"
    }
    
    @IBAction func btnCompartir(_ sender: Any) {
        let text = "hoy es el cumpleanos de \(nombreCompletoLbl.text!)"
        let image = UIImage(named: "cumple")
        let elementsToShare = [text, image!] as [Any]
        let activityVC = UIActivityViewController(activityItems: elementsToShare, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }

}
