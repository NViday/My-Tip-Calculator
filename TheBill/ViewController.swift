//
//  ViewController.swift
//  TheBill
//
//  Created by N'Vida Ange-Janine Yotcho on 12/26/15.
//  Copyright © 2015 N'Vida Ange-Janine Yotcho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK : properties
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var tipIndex: UISegmentedControl!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var perPerson: UILabel!
    
    //the other non used label
    
    @IBOutlet weak var billLabel: UILabel!
    
    @IBOutlet weak var TheTipLabel: UILabel!
    
    
    //the variables needed
    var billAmount : Double! = 0.0
    let tipPercent : [Double] = [0.10,0.12,0.15,0.18]
    var tip : Double = 0.0
    var total : Double = 0.0
    
    let each = " per "
    var person : Double! = 2.0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("view did load")
        
        // initializing the view to be the delegate
        billTextField.delegate=self
       
        
        // initializing the label
        
        tipLabel.text = " $0.0"
        tipLabel.textColor = UIColor .purpleColor()
        tipLabel.font = UIFont .italicSystemFontOfSize(13)
        
        totalLabel.text = " $0.0"
        totalLabel.font = UIFont .boldSystemFontOfSize(20)
        
        perPerson.text = "$0.0" + each
        
        //stylistic change
        
        billLabel.text = "Bill amount"
        billLabel.font = UIFont .italicSystemFontOfSize(13)
        
        TheTipLabel.text = "Tip"
        TheTipLabel.textColor = UIColor .purpleColor()
        TheTipLabel.font = UIFont .italicSystemFontOfSize(13)
    
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        print("view will appear")
        billAmount! = 0.0
       
        FinalDisplay()
        
        theOtherDisplay()
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        billAmount! = 0.0
        
        FinalDisplay()
        
        theOtherDisplay()
    }
    func textFieldDidEndEditing(textField: UITextField) {
        
        billAmount! = 0.0
        
        if textField.text != nil{
            billAmount = Double( textField.text! )!
        }
        
        FinalDisplay()
        
        theOtherDisplay()
    }
    
    // when the amount is cleared
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        
            billAmount! = 0.0
        
        
            FinalDisplay()
        
            theOtherDisplay()
            return true
        }
 
        
        
    // if change of tip percent - from the segmented buttons
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        FinalDisplay()
        
        
        theOtherDisplay()
        
    }
    
    //my func to avoid redundancy
    //first half of the app
    //calculating total amount
    
    func FinalDisplay(){
        
        tip = tipPercent[tipIndex.selectedSegmentIndex]
        
        let tipS : Double! = tip * billAmount!
        
        let totalS : Double! = billAmount  + tipS
        
        total = totalS
        
        tipLabel.text = String( format: "$%.2f", tipS)
        
        totalLabel.text = String( format: "$%.2f", totalS)
    }
    
    //Mark : properties
    
    @IBOutlet weak var thePersons: PersonControl!
    
    @IBOutlet weak var numberOfP: UISegmentedControl!
    
    
    
    // my second func to avoid redundancy 
    // second half of the view
    //calculating bill per persons
    
    func theOtherDisplay(){
        
        person! = Double(numberOfP.selectedSegmentIndex) + 2.0
        
        let perPers : Double! = total / person!
        
        perPerson.text = String( format : "$%.2f", perPers) + each
    }


    // if change of number of persons - from the segmented buttons
    
    @IBAction func editingPerPerson(sender: AnyObject) {
        
        theOtherDisplay()
    
    }
   
    
   
   
}

