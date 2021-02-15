//
//  CalculateViewController.swift
//  Tipsy
//
//  Created by Onopriienko.Sergii on 11.02.2021.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorTips = CalculatorOfTips()

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    private var percents = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        zeroPctButton.isSelected = true
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        switch sender.tag {
        case 0:
            percents = 0.0
        case 1:
            percents = 0.10
        case 2:
            percents = 0.20
        default: print("error")
        }
    }
    
    //MARK: - Action
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let billValue = Double(billTextField.text!) else { return }
        let numberOfPersons = Int(splitNumberLabel.text!)!
        calculatorTips.calculateOfTips(billValue: billValue, percents: percents, numberOfPersons: numberOfPersons)
        
        let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "resultViewController") as! ResultViewController
        destinationVC.persons = calculatorTips.getTips()
        destinationVC.totalTipPercentage = calculatorTips.getSettingsString()
        self.present(destinationVC, animated: true, completion: nil)
    }
}
