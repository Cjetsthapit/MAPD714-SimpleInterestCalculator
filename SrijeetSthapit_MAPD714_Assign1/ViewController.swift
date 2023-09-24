//
//  ViewController.swift
//  SrijeetSthapit_MAPD714_Assign1
//
//  Created by Srijeet Sthapit on 2023-09-19.
//
//  Project Name: Simple Interest Calculator
//  Student Name: Srijeet Sthapit
//  Student Id: 301365217
//  Last Modified On: 2023-09-24
//  App Description: The Simple Interest Calculator is a user-friendly iOS app designed to help users quickly and accurately calculate simple interest
//  based on the principal amount, rate of interest, and time period. The app also provides the total amount you'll have after earning interest.
//  It also provides the total amount the user will have after interest.
//  App Version: 1.0.0
//

import UIKit

class ViewController: UIViewController {

    //reference objects for views
    @IBOutlet var viewInput: UIView!
    @IBOutlet weak var amountBox: UIView!
    @IBOutlet weak var simpleInterestBox: UIView!
    @IBOutlet weak var bottomSheet: UIView!
    
    //reference objects for text fields
    @IBOutlet weak var principalText: UITextField!
    @IBOutlet weak var timeText: UITextField!
    @IBOutlet weak var rateText: UITextField!
    
    //reference objects for buttons
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    //reference objects for labels
    @IBOutlet weak var interestOutput: UILabel!
    @IBOutlet weak var amountOutput: UILabel!

    //called when view is loaded into memort
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //setup common styles for text fields
        setTextFieldStyles(principalText)
        setTextFieldStyles(timeText)
        setTextFieldStyles(rateText)
        
        
        //setup button properties for calculate and clear
        calculateButton.backgroundColor = UIColor(red: 105.0/255.0, green: 103.0/255.0, blue: 162.0/255.0, alpha: 1.0)
        calculateButton.setTitleColor(UIColor.white, for: .normal)
        clearButton.backgroundColor = .gray
        
        //set rounded corners for multiple ui elements
        setOverallCornerRadius()
        
        //hide the bottom sheet initially
        bottomSheet.isHidden = true
    }
    
    //function to set text field styles
    func setTextFieldStyles(_ textField: UITextField) {
        textField.layer.cornerRadius = 8
        textField.clearButtonMode = .always //shows clear button
    }

    //function to handle simple interest calculation
    @IBAction func calculateInterest(_ sender: Any) {
        //validating input fields
        if let principalValue = principalText.text, let principal = Double(principalValue), principal > 0.0,
           let rateValue = rateText.text, let rate = Double(rateValue), rate > 0.0,
           let timeValue = timeText.text, let time = Double(timeValue), time > 0.0 {
            //interest and amount calculation
            let interest = (principal * time * rate) / 100.00
           let total = principal + interest
            
            interestOutput.text = String(format: "%.2f", interest) // Format to display with two decimal places
            amountOutput.text = String(format: "%.2f", total) // Format to display with two decimal places
        } else  {
            //shows alert in case of invalid or empty inputs
            showAlert()
        }
    }
    
    // Function to show an alert for invalid input
     func showAlert() {
         let alert = UIAlertController(
             title: "Invalid Input",
             message: "Please make sure you have filled in all the fields and they are positive numbers.",
             preferredStyle: .alert
         )
         let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
         alert.addAction(okAction)
         present(alert, animated: true, completion: nil)
         clearDisplayFields();
     }
    
    //function to clear both input fields and display values
    @IBAction func clearFields(_ sender: Any) {
        clearInputFields();
        clearDisplayFields()
    }
    
    //function to clear input fields
    func clearInputFields(){
        principalText.text = ""
        rateText.text = ""
        timeText.text = ""
    }
    
    //function to set display fields to 0.0
    func clearDisplayFields(){
        interestOutput.text = "0.0"
        amountOutput.text = "0.0"
    }
    
    //function to set corner radius for various ui elements
    func setOverallCornerRadius(){
        calculateButton.layer.cornerRadius = 8
        simpleInterestBox.layer.cornerRadius = 8
        viewInput.layer.cornerRadius = 8
        amountBox.layer.cornerRadius = 8
        clearButton.layer.cornerRadius = 8
        closeButton.layer.cornerRadius = 8
    }
    
    //function to toggle bottom sheet
    @IBAction func showInfo(_ sender: Any) {
            self.bottomSheet.isHidden = !self.bottomSheet.isHidden
    }
    
}



