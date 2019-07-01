//
//  CreaSegnalazione.swift
//  BGT
//
//  Created by Mariarosa Savoldi on 07/06/2019.
//  Copyright © 2019 alexmocci. All rights reserved.
//

import UIKit

class CreaSegnalazione: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {
    
    var TipiSegnalazioni = ["Seleziona...","Anticipo","Ritardo","Controllori","Corse Mancanti","Altro"]
    var Tempi = ["Seleziona...","5 min.","10 min.","15 min.","20 min.","25 min."]
    var Corse = ["Seleziona...","Linea E","Linea C","Linea M"]
    
    var section:Int = 1
    var label:Int = 1
    @IBAction func AnnullaPressed(_ sender: Any) {
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func TipoTFClicked(_ sender: Any) {
        section = 1
        ShowPicker(TipoTFPicker,TipoPicker)
    }
    
    @IBAction func LineaTFClicked(_ sender: Any) {
        section = 2
        label = 2
        ShowPicker(LineaTFPicker,LineaPicker)
    }
    
    @IBAction func QuantoTFClicked(_ sender: Any) {
        section = 2
        label = 3
        ShowPicker(QuantoTFPicker,QuantoPicker)
    }
    
    @IBAction func LinFerTFClicked(_ sender: Any) {
        section = 4
        label = 3
        ShowPicker(LinFerTFPicker,LinFerPicker)
    }
    @IBAction func OreTFClicked(_ sender: Any) {
        section = 3
        label = 3
        showTimePicker()
    }
    @IBAction func DoveSegmentedControlChanged(_ sender: Any) {
        
    }
    
    @IBAction func InviaClicked(_ sender: Any) { //Push dati al database
        switch section {
        case 2:
            break
        case 3:
            break
        case 4:
            break
        case 5:
            break
        case 6:
            break
        default:
            break
        }
    }
    //Tutti
    @IBOutlet weak var TipoLabel: UILabel!
    @IBOutlet weak var TipoTFPicker: UITextField!
    var TipoPicker = UIPickerView()
    @IBOutlet weak var InviaButton: UIButton!
    
    //Anticipo/Ritardo Corse Mancanti
    @IBOutlet weak var LineaLabel: UILabel!
    @IBOutlet weak var LineaTFPicker: UITextField!
    var LineaPicker = UIPickerView()
    
    //Anticipo/Ritardo
    @IBOutlet weak var Quantolabel: UILabel!
    @IBOutlet weak var QuantoTFPicker: UITextField!
    var QuantoPicker = UIPickerView()
    
    //Controllori
    @IBOutlet weak var DoveLabel: UILabel!
    @IBOutlet weak var DoveSegmentedControl: UISegmentedControl!

    
    @IBOutlet weak var LinFerLabel: UILabel!
    @IBOutlet weak var LinFerTFPicker: UITextField!
    var LinFerPicker = UIPickerView()
    
    //Corse Mancanti
    @IBOutlet weak var OreLabel: UILabel!
    @IBOutlet weak var OreTFPicker: UITextField!
    var OrePicker = UIDatePicker()
    
    //Altro
    @IBOutlet weak var AltroTV: UITextView!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //AltroTextView
        AltroTV.delegate = self
        AltroTV.text = "Scrivici qualsiasi cosa..."
        AltroTV.textColor = UIColor.lightGray
        
        //TipoTextFieldPicker
        TipoPicker.delegate = self
        TipoTFPicker.inputView = TipoPicker
        //LineaTextFieldPicker
        LineaPicker.delegate = self
        LineaTFPicker.inputView = LineaPicker
        //QuantoTextFieldPicker
        QuantoPicker.delegate = self
        QuantoTFPicker.inputView = QuantoPicker
        //LinFerTextFieldPicker
        LinFerPicker.delegate = self
        LinFerTFPicker.inputView = LinFerPicker
    }
    
//---TIMEPICKER Corse Mancanti
    
    func showTimePicker(){
        OrePicker.datePickerMode = .time
        
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTimePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTimePicker));
        
        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        
        OreTFPicker.inputAccessoryView = toolbar
        OreTFPicker.inputView = OrePicker
        
    }
    
    @objc func doneTimePicker(){
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "UTC")
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "hh:mm"
        OreTFPicker.text =  formatter.string(from: OrePicker.date)
        self.view.endEditing(true)
        doneClick()
    }
    
    @objc func cancelTimePicker(){
       self.view.endEditing(true)
    }
    //---PICKER
    
    func ShowPicker(_ TextField: UITextField,_ Picker: UIPickerView) {
        let toolBar = UIToolbar()
        
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(CreaSegnalazione.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(CreaSegnalazione.cancelClick))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        TextField.inputAccessoryView = toolBar
        TextField.inputView = Picker
    }
    
    @objc func doneClick() {
        section = setSection(TipoTFPicker.text!)
        //Seleziona...
        LineaLabel.isHidden = true
        LineaTFPicker.isHidden = true
        Quantolabel.isHidden = true
        QuantoTFPicker.isHidden = true
        DoveLabel.isHidden = true
        DoveSegmentedControl.isHidden = true
        LinFerLabel.isHidden = true
        LinFerTFPicker.isHidden = true
        OreLabel.isHidden = true
        OreTFPicker.isHidden = true
        AltroTV.isHidden = true
        InviaButton.isHidden = true
        
        if(section == 2 || section == 3) { //Anticipo/Ritardo
            
            LineaLabel.isHidden = false
            LineaTFPicker.isHidden = false
            Quantolabel.isHidden = false
            QuantoTFPicker.isHidden = false
            InviaButton.isHidden = false
        }
        if(section == 4) { //Controllori
            
            DoveLabel.isHidden = false
            DoveSegmentedControl.isHidden = false
            LinFerLabel.isHidden = false
            LinFerTFPicker.isHidden = false
            InviaButton.isHidden = false
        }
        if(section == 5) { //Corse Mancanti
            
            LineaLabel.isHidden = false
            LineaTFPicker.isHidden = false
            OreLabel.isHidden = false
            OreTFPicker.isHidden = false
            InviaButton.isHidden = false
        }
        if(section == 6) { //Altro

            AltroTV.isHidden = false
            InviaButton.isHidden = false
        }
        TipoTFPicker.endEditing(true)
        LineaTFPicker.endEditing(true)
        QuantoTFPicker.endEditing(true)
        LinFerTFPicker.endEditing(true)
        OreTFPicker.endEditing(true)
    }
    @objc func cancelClick() {
        TipoTFPicker.endEditing(true)
    }
    
    
    
    
    
    //SetSection
    func setSection(_ string: String) -> Int {
        switch string {
        case TipiSegnalazioni[0]:
            return 1
        case TipiSegnalazioni[1]:
            return 2
        case TipiSegnalazioni[2]:
            return 3
        case TipiSegnalazioni[3]:
            return 4
        case TipiSegnalazioni[4]:
            return 5
        case TipiSegnalazioni[5]:
            return 6
        default:
            return 1
        }
    }

    
    
    
    //Picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        if(section == 2 || section == 3) {
            return Corse.count
        }
        return TipiSegnalazioni.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        if(section == 2 || section == 3) {
            return Corse[row]
        }
        return TipiSegnalazioni[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        if(section == 2 || section == 3) {
            LineaTFPicker.text = Corse[row]
        }else{
            TipoTFPicker.text = TipiSegnalazioni[row]
        }
    }
    

    //AltroTextView
    func textViewDidBeginEditing(_ textView: UITextView) {
        if AltroTV.textColor == UIColor.lightGray {
            AltroTV.text = nil
            AltroTV.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if AltroTV.text.isEmpty {
            AltroTV.text = "Scrivici qualsiasi cosa..."
            AltroTV.textColor = UIColor.lightGray
        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
        }
        return true
    }
  
}
