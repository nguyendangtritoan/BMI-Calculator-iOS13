//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightLable: UILabel!
    @IBOutlet weak var weightLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heightSlider.maximumValue = 3
        heightSlider.minimumValue = 0
        heightSlider.setValue(1.5, animated: true)
        weightSlider.maximumValue = 200
        weightSlider.minimumValue = 0
        weightSlider.setValue(100, animated: true)
        
    }
    @IBAction func heightSliderSlide(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLable.text = "\(height)m"
    }
    

    @IBAction func weightSliderSlide(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLable.text = "\(weight)kg"
    }
    @IBAction func calculatePressed(_ sender: Any) {
        let height = heightSlider.value
        print(height)
        let weight = weightSlider.value
        print(weight)
 
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        //print("BMI: ", bmi)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

