//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Nguyen Toan on 25.9.2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit


struct CalculatorBrain {
    var bmi: BMI?
    
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height*height)
        var advice: String = ""
        var color: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        if bmiValue < 18.5 {
            advice = "Eat more"
            color = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        }else if bmiValue  < 24.9 {
            advice = "You're beautiful"
            color = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        }else {
            advice = "Eat less"
            color = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        }
        
        bmi = BMI(value: bmiValue, advice: advice, color: color)
    }
    func getAdvice() -> String{
        return bmi?.advice ?? ""
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
}
