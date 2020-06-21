//
//  ViewController.swift
//  Listado Equipos Core Data
//
//  Created by DAMII on 6/14/20.
//  Copyright © 2020 Cibertec. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   

    
    
    @IBOutlet weak var tfCodigo: UITextField!
    
    @IBOutlet weak var tfNombrePlan: UITextField!
    
    @IBOutlet weak var tfPrecio: UITextField!
    
    @IBOutlet weak var tfRpm: UITextField!
    
    @IBOutlet weak var tfMinutos: UITextField!
    
    @IBOutlet weak var tfSms: UITextField!
    
    @IBOutlet weak var tfMb: UITextField!

    
    
    
    @IBOutlet weak var tvListaPlanes: UITableView!
    
   
    
    @IBOutlet weak var lblMensajes: UILabel!
    
    
  
    
    
    var oListaPlan=[NSManagedObject]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oListaPlan.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let oCelda=tableView.dequeueReusableCell(withIdentifier: "CeldaPlanes", for: indexPath) as! CeldaUsuarioTableViewCell
        
        oCelda.MostrarDatos(pPlan:  oListaPlan[indexPath.row] as! Plan )
        
        return oCelda
    }
    
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        self.tvListaPlanes.delegate = self
        self.tvListaPlanes.dataSource = self
        self.tvListaPlanes.rowHeight = 150
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       MostrarRegistros()
    }
    
    
    func MostrarRegistros()
    {
      
        
        
        let odelegado=UIApplication.shared.delegate as! AppDelegate
               let oContexto=odelegado.persistentContainer.viewContext
        
        let oListaPlanestmp: NSFetchRequest<Plan> = Plan.fetchRequest()
        
        do{
           let result = try oContexto.fetch(oListaPlanestmp)
            oListaPlan = result as [NSManagedObject]
            
        }
        catch (let oError as NSError)
        {
            print ("Error de lectura")
        }
        tvListaPlanes.reloadData()
        
        
        
        
        
        
        
        
    }

    @IBAction func btnAgregar_onclikc(_ sender: Any) {
            
        let odelegado=UIApplication.shared.delegate as! AppDelegate
        let oContexto=odelegado.persistentContainer.viewContext
      
        let oEntidad=NSEntityDescription.entity(forEntityName: "Plan", in: oContexto)
         let oregistro=NSManagedObject(entity: oEntidad!, insertInto: oContexto)
         
        oregistro.setValue(tfCodigo.text!, forKey: "codigo")
        oregistro.setValue(tfNombrePlan.text!, forKey: "planes")
        oregistro.setValue(tfPrecio.text!, forKey: "precio")
        oregistro.setValue(tfRpm.text!, forKey: "rpm")
        
        oregistro.setValue(tfMinutos.text!, forKey: "minutos")
        oregistro.setValue(tfSms.text!, forKey: "sms")
        
        oregistro.setValue(tfMb.text!, forKey: "mb")
        
        
        do
        {
            try oContexto.save()
            lblMensajes.text = "Se grabo correctamente"
        }
        catch(let oerrro as NSError)
        {
            print ("Error de grabado")
            lblMensajes.text = "Error de grabado"
        }
        MostrarRegistros()
        
    }
    
}

