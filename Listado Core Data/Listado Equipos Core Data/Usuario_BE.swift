//
//  Usuario_BE.swift
//  Listado de Usuarios
//
//  Created by DAMII on 10/5/19.
//  Copyright © 2019 DAMII. All rights reserved.
//

import UIKit

class Usuario_BE: NSObject {


    


    var CodigoPlan: integer_t
    var NombrePlan: String?
    var Precio: String?
    var Rpm: String?
    var Minutos: String?
    var Sms: String?
    var Mb: String?
    
    
    override  init() {

        
        self.CodigoPlan = 0
        self.NombrePlan = ""
        self.Precio = ""
        self.Rpm = ""
        self.Minutos = ""
        self.Sms = ""
        self.Mb = ""
        
        
        
    }
}
