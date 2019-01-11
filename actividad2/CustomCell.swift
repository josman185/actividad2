//
//  CustomCell.swift
//  actividad2
//
//  Created by jos on 1/8/19.
//  Copyright © 2019 My Organization. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    
    @IBOutlet weak var nombreCellLbl: UILabel!
    @IBOutlet weak var fechaNacimientoCellLbl: UILabel!
    @IBOutlet weak var edadCellLbl: UILabel!
    @IBOutlet weak var ubicacionCellLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
