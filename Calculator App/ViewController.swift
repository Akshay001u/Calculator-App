//
//  ViewController.swift
//  Calculator App
//
//  Created by Mac on 05/02/34.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var calculatorValues: UILabel!
    @IBOutlet weak var calculatorResult: UILabel!
    
    var values: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll() {
        values = ""
        calculatorValues.text = ""
        calculatorResult.text = ""
    }

    
    @IBAction func allClearClick(_ sender: UIButton) {
        clearAll()
    }
    
    @IBAction func backClick(_ sender: UIButton) {
        if(!values.isEmpty) {
            values.removeLast()
            calculatorValues.text = values
        }
    }
    
    func addTwoValues(value: String) {
        values = values + value
        calculatorValues.text = values
    }
    
    @IBAction func percentClick(_ sender: UIButton) {
        addTwoValues(value: "%")
    }
    
    @IBAction func divideClick(_ sender: UIButton) {
        addTwoValues(value: "/")
    }
    
    @IBAction func multiplyClick(_ sender: UIButton) {
        addTwoValues(value: "*")
    }
    
    @IBAction func minusClick(_ sender: UIButton) {
        addTwoValues(value: "-")
    }
    
    @IBAction func plusClick(_ sender: UIButton) {
        addTwoValues(value: "+")
    }
    
    @IBAction func equalToClick(_ sender: UIButton) {
        if(validInput())
        {
            let checkedValuesForPercent = values.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedValuesForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResult.text = resultString
        }
        else
        {
            let alert = UIAlertController(title: "Invalid Input", message: "Calculator unable to do math based on input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in values{
            if(specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if(index == 0)
            {
                return false
            }
            
            if(index == values.count - 1)
            {
                return false
            }
            
            if(previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter(char: Character) -> Bool {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func decimalClick(_ sender: UIButton) {
        addTwoValues(value: ".")
    }
    
    @IBAction func zeroClick(_ sender: UIButton) {
        addTwoValues(value: "0")
    }
    
    @IBAction func oneClick(_ sender: UIButton) {
        addTwoValues(value: "1")
    }
    
    @IBAction func twoClick(_ sender: UIButton) {
        addTwoValues(value: "2")
    }
    
    @IBAction func threeClick(_ sender: UIButton) {
        addTwoValues(value: "3")
    }
    
    @IBAction func fourClick(_ sender: UIButton) {
        addTwoValues(value: "4")
    }
    
    @IBAction func fiveClick(_ sender: UIButton) {
        addTwoValues(value: "5")
    }
    
    @IBAction func sixClick(_ sender: UIButton) {
        addTwoValues(value: "6")
    }
    
    @IBAction func sevenClick(_ sender: UIButton) {
        addTwoValues(value: "7")
    }
    
    @IBAction func eightClick(_ sender: UIButton) {
        addTwoValues(value: "8")
    }
    
    @IBAction func nineClick(_ sender: UIButton) {
        addTwoValues(value: "9")
    }
    
    
}

