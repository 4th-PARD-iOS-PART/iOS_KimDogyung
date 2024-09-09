//
//  ViewController.swift
//  1st_hw_KimDogyung
//
//  Created by 김도경 on 2024/09/08.
//

import UIKit

class ViewController: UIViewController {
    
    var calculating:String = ""
    
    func addToCal(value: String){
        calculating = calculating + value
        resultLabel.text = calculating
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func allClearButton(_ sender: Any) {
        resultLabel.text = "0"
        calculating = ""
    }
    
    
    
    
    
    @IBAction func divideButton(_ sender: Any) {
        addToCal(value: "/")
    }
    
    
    @IBAction func minusButton(_ sender: Any) {
        addToCal(value: "-")
    }
    
    
    @IBAction func muliflyButton(_ sender: Any) {
        addToCal(value: "*")
    }
    
    
    @IBAction func plusButton(_ sender: Any) {
        addToCal(value: "+")
    }
    
    
    @IBAction func equalButton(_ sender: Any) {
        let expression = NSExpression(format: calculating)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        
        let resultString = formatResult(result: result)
        resultLabel.text = resultString
    }
    
    func formatResult(result: Double) -> String {
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }
    
    
    @IBAction func zeroButton(_ sender: Any) {
        addToCal(value: "0")
    }
    
    @IBAction func oneButton(_ sender: Any) {
        addToCal(value: "1")
    }
    
    @IBAction func twoButton(_ sender: Any) {
        addToCal(value: "2")
    }
    
    
    @IBAction func threeButton(_ sender: Any) {
        addToCal(value: "3")
    }
    
    
    
    @IBAction func fourButton(_ sender: Any) {
        addToCal(value: "4")
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        addToCal(value: "5")
    }
    
    
    @IBAction func sixButton(_ sender: Any) {addToCal(value: "6")
    }
    
    
    @IBAction func sevenButton(_ sender: Any) {
        addToCal(value: "7")
    }
    
    @IBAction func eightButton(_ sender: Any) {
        addToCal(value: "8")
    }
    
    
    @IBAction func nineButton(_ sender: Any) {
        addToCal(value: "9")
    }
    
}

