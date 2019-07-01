//
//  FirstViewController.swift
//  BGT
//
//  Created by user153403 on 4/22/19.
//  Copyright © 2019 alexmocci. All rights reserved.
//

import UIKit

class RicercaViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var DaTextField: UITextField!

    @IBOutlet weak var ATextField: UITextField!
    
    var suggestions = ["Bergamo","Tavernola"]
    var Trovato: Bool = false
    var trv1:Bool = false
    var trv2:Bool = false
    var string2:String?
    var string1:String?
    @IBAction func CercaPressed(_ sender: Any) {
        CercaIsPressed()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        DaTextField.delegate = self
        ATextField.delegate = self
        
    }
    
    func CercaIsPressed() {
        trv1 = false
        trv2 = false
        Trovato = false
        for suggestion in suggestions {
            if DaTextField.text == suggestion
            {
                trv1 = true
            }
            if ATextField.text == suggestion
            {
                trv2 = true
            }
            if trv1 == true && trv2 == true
            {
                Trovato = true
                break
            }
        }
        if (DaTextField.text == "" || ATextField.text == "") || (DaTextField.text == "" && ATextField.text == "")
        {
            let alert = UIAlertController(title: "Riempi entrambi i campi", message: "Per cercare una corsa devi inserire sia partenza che arrivo ;-)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                @unknown default:
                    fatalError()
                }}))
            self.present(alert, animated: true, completion: nil)
        }
        else if Trovato == false
        {
            let alert = UIAlertController(title: "Non è stata trovata nessuna corsa!", message: "Controlla di aver riempito correttamente i campi altrimenti la corsa che stai cercando non è disponibile", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                @unknown default:
                    fatalError()
                }}))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    //AutoCompleteText DaTextField
    func textField(with DaTextField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string1: String) -> Bool {
        return !autoCompleteText( in : DaTextField, using: string1, suggestions: suggestions)
    }
    func autoCompleteText(with DaTextField: UITextField, using string1: String, suggestions: [String]) -> Bool {
        if !string1.isEmpty,
            let selectedTextRange = DaTextField.selectedTextRange,
            selectedTextRange.end == DaTextField.endOfDocument,
            let prefixRange = DaTextField.textRange(from: DaTextField.beginningOfDocument, to: selectedTextRange.start),
            let text = DaTextField.text( in : prefixRange) {
            let prefix = text + string1
            let matches = suggestions.filter {
                $0.hasPrefix(prefix)
            }
            if (matches.count > 0) {
                DaTextField.text = matches[0]
                if let start = DaTextField.position(from: DaTextField.beginningOfDocument, offset: prefix.count) {
                    DaTextField.selectedTextRange = DaTextField.textRange(from: start, to: DaTextField.endOfDocument)
                    return true
                }
            }
        }
        return false
    }
    func textFieldShouldReturn(with DaTextField: UITextField) -> Bool {
        DaTextField.resignFirstResponder()
        return true
    }
    
    //AutoCompleteText ATextField
     func textField(_ ATextField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string2: String) -> Bool {
        return !autoCompleteText( in : ATextField, using: string2, suggestions: suggestions)
    }
    func autoCompleteText( in ATextField: UITextField, using string2: String, suggestions: [String]) -> Bool {
        if !string2.isEmpty,
            let selectedTextRange = ATextField.selectedTextRange,
            selectedTextRange.end == ATextField.endOfDocument,
            let prefixRange = ATextField.textRange(from: ATextField.beginningOfDocument, to: selectedTextRange.start),
            let text = ATextField.text( in : prefixRange) {
            let prefix = text + string2
            let matches = suggestions.filter {
                $0.hasPrefix(prefix)
            }
            if (matches.count > 0) {
                ATextField.text = matches[0]
                if let start = ATextField.position(from: ATextField.beginningOfDocument, offset: prefix.count) {
                    ATextField.selectedTextRange = ATextField.textRange(from: start, to: ATextField.endOfDocument)
                    return true
                }
            }
        }
        return false
    }
    func textFieldShouldReturn(_ ATextField: UITextField) -> Bool {
        ATextField.resignFirstResponder()
        return true
    }
    
}
