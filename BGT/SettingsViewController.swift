//
//  ThirdViewController.swift
//  BGT
//
//  Created by user153403 on 4/22/19.
//  Copyright © 2019 alexmocci. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    @IBOutlet weak var NameLabel: UITextField!
    @IBOutlet weak var NameLenghtMax: UILabel!
    @IBOutlet weak var AccountImageView: UIImageView!
    @IBAction func NameLabelEntered(_ sender: Any) {
        NameLenghtMax.isHidden = false
            var string = NameLabel.text
            if(string != nil) {
                NameLenghtMax.text = String(25 - string!.count)
        }
    }
    @IBAction func NameLabelExit(_ sender: Any) {
       NameLenghtMax.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 /*       AccountImageView.layer.cornerRadius = AccountImageView.frame.size.width / 2
        AccountImageView.clipsToBounds = true*/
        // Do any additional setup after loading the view.
    }
    
    
}
class SettingsCell: UITableViewCell {
    
}
