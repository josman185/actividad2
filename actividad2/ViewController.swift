//
//  ViewController.swift
//  actividad2
//
//  Created by jos on 1/8/19.
//  Copyright © 2019 My Organization. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,DataEnteredDelegate {
    
    @IBOutlet weak var tableContactos: UITableView!
    var contactos = [Contacto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableContactos.delegate = self
        tableContactos.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableContactos.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! CustomCell
        
        cell.nombreCellLbl.text = "\(contactos[(indexPath as NSIndexPath).row].nombre) \(contactos[(indexPath as NSIndexPath).row].paterno) \(contactos[(indexPath as NSIndexPath).row].materno)"
        cell.fechaNacimientoCellLbl.text = "Nac: \(contactos[(indexPath as NSIndexPath).row].fecha_nacimiento)"
        cell.edadCellLbl.text = "Edad: \(contactos[(indexPath as NSIndexPath).row].edad)"
        cell.ubicacionCellLbl.text = "Ubicacion: \(contactos[(indexPath as NSIndexPath).row].ubicacion)"

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func userDidEnterInformation(_ nombre: String, paterno: String, materno: String, fechaNacimiento: String, edad: Int, ubicacion: String, parentesco: String) {
        let contacto = Contacto(nombre: nombre, paterno: paterno, materno: materno, fechaNacimiento: fechaNacimiento, edad: edad, ubicacion: ubicacion, parentesco: parentesco)
        contactos.append(contacto)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seguetoAddContacto" {
            let contactovc = segue.destination as! AddContacto
            contactovc.delegate = self
        }
        if segue.identifier == "seguetoDetalleVC" {
            let detalle = segue.destination as! DetalleVC
            let row = (self.tableContactos.indexPathForSelectedRow! as NSIndexPath).row
            detalle.nombre = contactos[row].nombre
            detalle.paterno = contactos[row].paterno
            detalle.materno = contactos[row].materno
            detalle.fechaNacimiento = contactos[row].fecha_nacimiento
            detalle.edad = contactos[row].edad
            detalle.ubicacion = contactos[row].ubicacion
        }
    }
}

