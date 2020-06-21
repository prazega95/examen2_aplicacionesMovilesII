//
//  CeldaUsuarioTableViewCell.swift
//  Listado Equipos Core Data
//
//  Created by DAMII on 6/14/20.
//  Copyright © 2020 Cibertec. All rights reserved.
//

import UIKit


class CeldaUsuarioTableViewCell: UITableViewCell {
    
    
    /*@IBOutlet weak var lblNombres: UILabel!*/

    @IBOutlet weak var lblNombrePlan: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    
    }
   public func MostrarDatos(pPlan: Plan)

{
     lblNombrePlan.text = pPlan.planes
   
    
}
    
}
