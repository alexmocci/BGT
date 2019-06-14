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
        ShowPicker(TipoTF,TipoPicker)
    }
    
    @IBAction func SecondTFClicked(_ sender: Any) {
        
        ShowPicker(SecondTF,SecondPicker)
    }
    
    @IBAction func ThirdTFClicked(_ sender: Any) {
        
        showTimePicker()
    }
    @IBAction func FourthTFClicked(_ sender: Any) {
        label = 4
        ShowPicker(FourthTF,OraPicker)
    }
    
    @IBAction func end2(_ sender: Any) {
        label = 3
    }
    @IBAction func end3(_ sender: Any) {
        label = 4
    }
    @IBAction func end4(_ sender: Any) {
        label = 5
    }
    @IBAction func InviaClicked(_ sender: Any) {
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
    
    @IBOutlet weak var FirstLabel: UILabel!
    @IBOutlet weak var InviaButton: UIButton!
    @IBOutlet weak var SecondLabel: UILabel!
    @IBOutlet weak var SecondTF: UITextField!
    @IBOutlet weak var AltroTV: UITextView!
    @IBOutlet weak var TipoTF: UITextField!
    @IBOutlet weak var ThirdLabel: UILabel!
    @IBOutlet weak var ThirdTF: UITextField!
    @IBOutlet weak var FourthLabel: UILabel!
    @IBOutlet weak var FourthTF: UITextField!
    var TipoPicker = UIPickerView()
    var SecondPicker = UIPickerView()
    var OraPicker = UIPickerView()
    var TimePicker = UIDatePicker()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //AltroTextView
        AltroTV.delegate = self
        AltroTV.text = "Scrivici qualsiasi cosa..."
        AltroTV.textColor = UIColor.lightGray
        
        //TipoTextField
        TipoPicker.delegate = self
       
        //SecondTextField
        SecondPicker.delegate = self
        

        FirstLabel.text = "Tipo:"
        SecondLabel.text = "Linea:"
        ThirdLabel.text = "Ora:"
    }
    
//---TIMEPICKER
    
    func showTimePicker(){
        TimePicker.datePickerMode = .time
        
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTimePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTimePicker));
        
        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        
        ThirdTF.inputAccessoryView = toolbar
        ThirdTF.inputView = TimePicker
        
    }
    
    @objc func doneTimePicker(){
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "UTC")
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "hh:mm"
        ThirdTF.text =  formatter.string(from: TimePicker.date)
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
        section = setSection(TipoTF.text!)
        if(section == 1) {
            label = 2
            SecondTF.isHidden = true
            SecondLabel.isHidden = true
            AltroTV.isHidden = true
            ThirdTF.isHidden = true
            ThirdLabel.isHidden = true
            FourthTF.isHidden = true
            FourthLabel.isHidden = true
            InviaButton.isHidden = true
        }
        if(section == 2 || section == 3) {
            
            SecondTF.isHidden = false
            SecondLabel.isHidden = false
            AltroTV.isHidden = true
            if(label == 3) {
                
                ThirdTF.isHidden = false
                ThirdLabel.isHidden = false
            }
            if(label == 4)
            {
                FourthTF.isHidden = false
                FourthLabel.isHidden = false
                FourthLabel.text = "Quanto:"
            }
            if(label == 5){
                InviaButton.isHidden = false
            }
        }
        if(section == 4) {
            
            SecondTF.isHidden = false
            SecondLabel.isHidden = false
            AltroTV.isHidden = true
            if(label == 3) {
                ThirdTF.isHidden = false
                ThirdLabel.isHidden = false
            }
            if(label == 4)
            {
                FourthTF.isHidden = false
                FourthLabel.isHidden = false
                FourthLabel.text = "Fermata:"
            }
            if(label == 5){
                InviaButton.isHidden = false
            }
        }
        if(section == 5) {
            
            SecondTF.isHidden = false
            SecondLabel.isHidden = false
            AltroTV.isHidden = true
            if(label == 3) {
                ThirdTF.isHidden = false
                ThirdLabel.isHidden = false
            }
            if(label == 4)
            {
                InviaButton.isHidden = false
            }
        }
        if(section == 6) {

            
            SecondTF.isHidden = true
            SecondLabel.isHidden = true
            AltroTV.isHidden = false
            if(label == 3) {
                InviaButton.isHidden = false
            }
        }
        TipoTF.endEditing(true)
        SecondTF.endEditing(true)
        ThirdTF.endEditing(true)
        FourthTF.endEditing(true)
    }
    @objc func cancelClick() {
        TipoTF.endEditing(true)
        
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
            SecondTF.text = Corse[row]
        }else{
            TipoTF.text = TipiSegnalazioni[row]
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
