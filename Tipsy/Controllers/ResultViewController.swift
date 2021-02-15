//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Onopriienko.Sergii on 11.02.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    var persons: String?
    var totalTipPercentage: String?

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = persons
        settingsLabel.text = totalTipPercentage
    }
    
    @IBAction private func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
