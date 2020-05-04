//
//  BullsEyeViewController.swift
//  ProjectGoto
//
//  Created by Thulani Mtetwa on 2020/05/04.
//  Copyright © 2020 Thulani Mtetwa. All rights reserved.
//

import UIKit

class BullsEyeViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let roundedValue = self.slider.value.rounded()
        self.currentValue = Int(roundedValue)
        self.startNewRound()
    }
 
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = self.slider.value.rounded()
        self.currentValue = Int(roundedValue)
    }
    
    @IBAction func showAlert() {
        
        let message = "The value of the slider is now: \(self.currentValue)" +
        "\nThe target value is: \(self.targetValue)"
        
        let alert = UIAlertController(title: "Hello, World!", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        self.startNewRound()
    }
    
    func startNewRound() {
        self.targetValue = Int.random(in: 1...100)
        self.currentValue = 50
        self.slider.value = Float(self.currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        self.targetLabel.text = String(self.targetValue)
    }
}
