//
//  AddContacto.swift
//  actividad2
//
//  Created by jos on 1/8/19.
//  Copyright © 2019 My Organization. All rights reserved.
//

import UIKit

protocol DataEnteredDelegate: class {
    func userDidEnterInformation(_ nombre: String, paterno:String, materno:String, fechaNacimiento: String, edad: Int, ubicacion: String, parentesco: String)
}

class AddContacto: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var nombretxt: UITextField!
    @IBOutlet weak var paternotxt: UITextField!
    @IBOutlet weak var maternotxt: UITextField!
    @IBOutlet weak var ubicaciontxt: UITextField!
    @IBOutlet weak var parntescotxt: UITextField!
    @IBOutlet weak var nacimiento_picker: UIDatePicker!
    @IBOutlet weak var edadLbl: UILabel!
    var fechaDeNacimiento: String = ""
    var edad: Int = 0
    
    weak var delegate: DataEnteredDelegate! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        nacimiento_picker.addTarget(self, action: #selector(self.valueChanged(_:)), for: UIControlEvents.valueChanged)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 0
    }

    @IBAction func btnGuardar(_ sender: AnyObject) {
        delegate?.userDidEnterInformation(nombretxt.text!, paterno: paternotxt.text!, materno: maternotxt.text!, fechaNacimiento: fechaDeNacimiento, edad: edad, ubicacion: ubicaciontxt.text!, parentesco: parntescotxt.text!)

        
        // go back to the previous view controller
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    @objc func valueChanged(_ datePicker: UIDatePicker) {
        //let selectedDate = datePicker.date as NSDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let selectedDate = dateFormatter.string(from: datePicker.date)
        print(selectedDate)
        fechaDeNacimiento = selectedDate
        
        let gregorian = Calendar(identifier: .gregorian)
        let ageComponents = gregorian.dateComponents([.year], from: datePicker.date, to: Date())
        edad = ageComponents.year!
        
        edadLbl.text = "tu edad es: \(edad) años."
    }
    
}
