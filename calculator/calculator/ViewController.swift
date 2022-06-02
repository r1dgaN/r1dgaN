//
//  ViewController.swift
//  calculator
//
//  Created by Гость on 17.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnAC: UIButton!
    @IBOutlet weak var btnzero: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var btnequal: UIButton!
    @IBOutlet weak var buttons: UIView!
    @IBOutlet weak var buttonChangeResultLabel: UIStepper!
    var numberOne = ""
    var numberTwo = ""
    var operand = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func inputNumber(_ sender: UIButton) {
        if operand.isEmpty{
            numberOne = numberOne +
            (sender.titleLabel?.text)!
            resultLabel.text = numberOne
        }else{
            numberTwo = numberTwo +
            (sender.titleLabel?.text)!
            resultLabel.text = numberTwo
        }
    }
    @IBAction func inputOperand(_ sender: UIButton) {
        operand = sender.titleLabel?.text as!
         String
    }
    @IBAction func clearAction(_ sender: UIButton) {
        numberOne = ""
        numberTwo = ""
        operand = ""
        resultLabel.text =  "0"
    }
    @IBAction func result(_ sender: UIButton) {
        var result = 0.0
        
        switch operand{
        case "/":
            result = Double(numberOne)! /
            Double(numberTwo)!
        case "+":
            result = Double(numberOne)! +
            Double(numberTwo)!
        case "-":
            result = Double(numberOne)! -
            Double(numberTwo)!
        case "*":
            result = Double(numberOne)! *
            Double(numberTwo)!
        default:
            break
        }
        if result.truncatingRemainder(dividingBy: 1.0)
            == 0.0{
            resultLabel.text = String(Int(result))
        } else {
            resultLabel.text = String(result)
        }
    }
    @IBAction func stepper(_ sender: UIStepper) {
        let font = resultLabel.font?.fontName
        let fontSize = CGFloat(sender.value)
        resultLabel.font = UIFont(name: font!, size: fontSize)
    }
    @IBAction func hiddenButtons(_ sender: UISwitch) {
        buttons.isHidden = !buttons.isHidden
        resultLabel.isHidden = !resultLabel.isHidden
    }
}

