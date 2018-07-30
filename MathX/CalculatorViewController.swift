//
//  CalculatorViewController.swift
//  MathX
//
//  Created by Zachary Sim on 16/4/18.
//  Copyright © 2018 Zachary Sim. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var number:Int = 0
    @IBOutlet weak var label: UILabel!
    var empty = true
    var first = 0
    var operation = ""
    var noddd = true
    var isitfirstnumber = true
    @IBAction func buttton(_ sender: UIButton) {
        print(noddd)
        if(noddd == true){
        label.text = ""
            label.text = "" + (sender.titleLabel?.text)!
            operation = operation + (sender.titleLabel?.text)!
        print(operation)
        label.text = operation
        }else{
            if(isitfirstnumber == true){
                operation = (sender.titleLabel?.text)!
                label.text = operation
                noddd = true
            }else{
                label.text = ""
                label.text = "" + (sender.titleLabel?.text)!
                operation = operation + (sender.titleLabel?.text)!
                print(operation)
                label.text = operation
              noddd = true
            }
            
        }
    }
    
    @IBAction func operations(_ sender: UIButton) {
        
        if(label.text != ""){
           empty = false
        }
        if(sender.titleLabel?.text == "+"){
            if(empty == false){
                if(operation !=  ""){
                if(String(operation.last!) == "x" || String(operation.last!) == "÷"){
                print("error")
                }else{
                operation = operation + "+"
                    isitfirstnumber = false
                label.text = operation
                }
            }
            }
        }else if (sender.titleLabel?.text == "-"){
            if(empty == false){
                 if(operation !=  ""){
                isitfirstnumber = false
                operation = operation + "-"
                label.text = operation
            }
            }
        }else if (sender.titleLabel?.text == "("){
            if(empty == false){
                 if(operation !=  ""){
                if(String(operation.last!) != "*" || String(operation.last!) != "/" || String(operation.last!) != "-" || String(operation.last!) == "+"){
                    print("error")
                }else{
                isitfirstnumber = false
                operation = operation + "*"
                label.text = operation
                }
            }
            }
        }else if (sender.titleLabel?.text == ")"){
            if(empty == false){
                if(operation !=  ""){
                    if(String(operation.last!) == "*" || String(operation.last!) == "/" || String(operation.last!) == "-" || String(operation.last!) == "+"){
                        print("error")
                    }else{
                        isitfirstnumber = false
                        operation = operation + "*"
                        label.text = operation
                    }
                }
            }
        }else if (sender.titleLabel?.text == "."){
            if(empty == false){
                if(operation !=  ""){
                    if(Int(String(operation.last!)) == nil || String(operation.last!) == "/" || String(operation.last!) == "-" || String(operation.last!) == "+" || noddd == false){
                        print("error")
                    }else{
                        isitfirstnumber = false
                        operation = operation + "."
                        label.text = operation
                    }
                }
            }
        }else if (sender.titleLabel?.text == "x"){
                if(empty == false){
                    if(operation !=  ""){
                        if(String(operation.last!) == "*" || String(operation.last!) == "/" || String(operation.last!) == "-" || String(operation.last!) == "+"){
                            print("error")
                        }else{
                            isitfirstnumber = false
                            operation = operation + "*"
                            label.text = operation
                        }
                    }
                }
        }else if (sender.titleLabel?.text == "÷"){
            if(empty == false){
                 if(operation !=  ""){
                print(operation.last!)
                if(String(operation.last!) == "*" || String(operation.last!) == "/" || String(operation.last!) == "-" || String(operation.last!) == "+"){
                    print("error")
                }else{
                    isitfirstnumber = false
                operation = operation + "/"
                label.text = operation
                }
            }
            }
            
        }else if (sender.titleLabel?.text == "="){
            if(operation.replacingOccurrences(of: "+", with: "") == "" || operation.replacingOccurrences(of: "-", with: "") == "" || operation.replacingOccurrences(of: "/", with: "") == "" || operation.replacingOccurrences(of: "*", with: "") == "" ){
                print("error,user stupid")
                return
            }else{
                do {
                    print(NSExpression(format:operation))
                    if var labe:Double = operation.calculate()! {
                        label.text = String(describing: labe)
                        operation = String(labe.rounded(toPlaces: 1))
                        isitfirstnumber = true
                        noddd = false
                    }else{
                        label.text = "error"
                    }
                } catch {
                    print(error.localizedDescription)
                }
                
            
            }
        }

        print(operation)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ac(_ sender: Any) {
        operation = ""
        label.text = ""
        noddd = true
        isitfirstnumber = true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension String {
    
    private func allNumsToDouble() -> String {
        
        let symbolsCharSet = ".,"
        let fullCharSet = "0123456789" + symbolsCharSet
        var i = 0
        var result = ""
        var chars = Array(self)
        while i < chars.count {
            if fullCharSet.contains(chars[i]) {
                var numString = String(chars[i])
                i += 1
                loop: while i < chars.count {
                    if fullCharSet.contains(chars[i]) {
                        numString += String(chars[i])
                        i += 1
                    } else {
                        break loop
                    }
                }
                if let num = Double(numString) {
                    result += "\(num)"
                } else {
                    result += numString
                }
            } else {
                result += String(chars[i])
                i += 1
            }
        }
        return result
    }
    
    func calculate() -> Double? {
        let transformedString = allNumsToDouble()
        let expr = NSExpression(format: transformedString)
        return expr.expressionValue(with: nil, context: nil) as? Double
    }
}
extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}


