//
//  SecondViewController.swift
//  BGT
//
//  Created by user153403 on 4/22/19.
//  Copyright © 2019 alexmocci. All rights reserved.
//

import UIKit

class RisultatiSegnalazioni: UITableViewCell {
    @IBOutlet weak var DaLabel: UILabel!
    @IBOutlet weak var ALabel: UILabel!
    @IBOutlet weak var LineaImageView: UIImageView!
    @IBOutlet weak var OraPartenzaLabel: UILabel!
    @IBOutlet weak var OraArrivoLabel: UILabel!
    @IBOutlet weak var TipoLabel: UILabel!
    @IBOutlet weak var Tipo2Label: UILabel!
    @IBOutlet weak var MoreButton: UIButton!
    
}

class SegnalazioniViewController: UITableViewController {

    @IBOutlet weak var SegnalazioniTableView: UITableView!
   
    
    public var Segnalazioni = [Corsa]()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        SegnalazioniTableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        SegnalazioniTableView.delegate = self
        SegnalazioniTableView.dataSource = self
        
        let obj = Corsa(NomeCorsa: "E",LuogoPartenza: "Bergamo",LuogoArrivo: "Tavernola",OraPartenza: 17.15,OraArrivo: 19.30,Ritardo: 12,Anticipo: 0,Controllori: false)
        Segnalazioni.append(obj)
        
    }
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    /*override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     return "Corse Trovate"
     }*/
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Segnalazioni.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SegnalazioniTableView.dequeueReusableCell(withIdentifier: "SegnalazioniCell", for: indexPath) as! RisultatiSegnalazioni
        cell.DaLabel?.text = Segnalazioni[indexPath.row].LuogoPartenza
        cell.OraPartenzaLabel?.text = String(Segnalazioni[indexPath.row].OraPartenza)
        cell.ALabel?.text = Segnalazioni[indexPath.row].LuogoArrivo
        cell.OraArrivoLabel?.text = String(Segnalazioni[indexPath.row].OraArrivo)
        cell.LineaImageView?.image = nil
        cell.Tipo2Label.text = "b"
        cell.TipoLabel.text = "a"
        return cell
    }
}
