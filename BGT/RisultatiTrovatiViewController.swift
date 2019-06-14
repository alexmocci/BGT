//
//  RisultatiTrovatiViewController.swift
//  BGT
//
//  Created by user153403 on 4/22/19.
//  Copyright © 2019 alexmocci. All rights reserved.
//
import UIKit

class RisultatiCorse: UITableViewCell {
    @IBOutlet weak var LuogoPartenzaLabel: UILabel!
    @IBOutlet weak var OraPartenzaLabel: UILabel!
    @IBOutlet weak var LuogoArrivoLabel: UILabel!
    @IBOutlet weak var OraArrivoLabel: UILabel!
}

class RisultatiTrovatiViewController: UITableViewController {
    
    @IBOutlet weak var RisultatiTrovatiTableView: UITableView!
    
    
    var Corse = [Corsa]()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        RisultatiTrovatiTableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        RisultatiTrovatiTableView.delegate = self
        RisultatiTrovatiTableView.dataSource = self
        
        let obj = Corsa(NomeCorsa: "E",LuogoPartenza: "Bergamo",LuogoArrivo: "Tavernola",OraPartenza: 17.15,OraArrivo: 19.30,Ritardo: 12,Anticipo: 0,Controllori: false)
        Corse.append(obj)   
        
    }

   

        
    /*override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Corse Trovate"
        }*/
        
    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return Corse.count
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RisultatiTrovatiTableView.dequeueReusableCell(withIdentifier: "RisultatiCell", for: indexPath) as! RisultatiCorse
        cell.LuogoPartenzaLabel?.text = Corse[indexPath.row].LuogoPartenza
        cell.OraPartenzaLabel?.text = String(Corse[indexPath.row].OraPartenza)
        cell.LuogoArrivoLabel?.text = Corse[indexPath.row].LuogoArrivo
        cell.OraArrivoLabel?.text = String(Corse[indexPath.row].OraArrivo)
        return cell
        }
        
    }     
class Corsa: NSObject {
    
    var NomeCorsa: String = "E"
    var LuogoPartenza: String
    var OraPartenza: Double
    var LuogoArrivo: String
    var OraArrivo: Double
    var Anticipo: Float
    var Ritardo: Float
    var Controllori: Bool
    
    init(NomeCorsa: String,LuogoPartenza: String,LuogoArrivo: String,OraPartenza: Double,OraArrivo: Double,Ritardo: Float,Anticipo: Float,Controllori: Bool) {
        self.NomeCorsa = NomeCorsa
        self.LuogoPartenza = LuogoPartenza
        self.OraPartenza = OraPartenza
        self.LuogoArrivo = LuogoArrivo
        self.OraArrivo = OraArrivo
        self.Anticipo = Anticipo
        self.Ritardo = Ritardo
        self.Controllori = Controllori
    }
    
}
