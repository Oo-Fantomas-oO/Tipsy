//
//  CalculatorOfTips.swift
//  Tipsy
//
//  Created by Onopriienko.Sergii on 13.02.2021.
//

import Foundation

struct CalculatorOfTips {
    var tips: TipParameters?
    
    func getTips() -> String {
        guard let finalResult = tips?.tips else { return "" }
        return String(format: "%.2f", finalResult)
     }
    
    func getSettingsString() -> String {
        guard let tipsPercentage = tips?.tipPercentage else { return "0.0" }
        guard let numberOfPeople = tips?.numberOfPeople else { return "0" }
        return "Split between \(numberOfPeople) people, with \(String(format: "%.0f", tipsPercentage  * 100))% tip."
    }
    
    mutating func calculateOfTips(billValue: Double, percents:Double, numberOfPersons: Int) {
        let tipsValue = ((billValue * percents) + billValue) / Double(numberOfPersons)
        self.tips = TipParameters(tips: tipsValue, numberOfPeople: numberOfPersons, tipPercentage: percents)
    }
}
