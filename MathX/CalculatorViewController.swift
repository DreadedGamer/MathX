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
    
    @IBAction func buttton(_ sender: UIButton) {
        label.text = ""
        label.text = label.text! + String(sender.tag)
         number = Int(label.text!)!
        operation = operation + String(number)
        print(operation)
        label.text = operation
    }
    
    @IBAction func operations(_ sender: UIButton) {
        
        if(label.text != ""){
           empty = false
        }
        if(sender.titleLabel?.text == "+"){
            if(empty == false){
                first = Int(number)
                if(String(operation.last!) == "x" || String(operation.last!) == "÷"){
                print("error")
                }else{
                operation = operation + "+"
                label.text = operation
                }
            }
        }else if (sender.titleLabel?.text == "-"){
            if(empty == false){
                first = Int(number)
                operation = operation + "-"
                label.text = operation
            }
            
        }else if (sender.titleLabel?.text == "x"){
            if(empty == false){
                first = Int(number)
                if(String(operation.last!) == "*" || String(operation.last!) == "/"){
                    print("error")
                }else{
                operation = operation + "*"
                label.text = operation
                }
            }
            
        }else if (sender.titleLabel?.text == "÷"){
            if(empty == false){
                first = Int(number)
                print(operation.last!)
                if(String(operation.last!) == "*" || String(operation.last!) == "/"){
                    print("error")
                }else{
                operation = operation + "/"
                label.text = operation
                }
            }
            
        }else if (sender.titleLabel?.text == "="){
    print(operation)
            print(NSExpression(format:operation))
            if(operation.replacingOccurrences(of: "+", with: "") == "" || operation.replacingOccurrences(of: "-", with: "") == "" || operation.replacingOccurrences(of: "/", with: "") == "" || operation.replacingOccurrences(of: "*", with: "") == ""){
                return
            }
            var hi = operation.replacingOccurrences(of: "+", with: ".0+")
             hi = hi.replacingOccurrences(of: "-", with: ".0-")
             hi = hi.replacingOccurrences(of: "/", with: ".0/")
            hi = hi.replacingOccurrences(of: "*", with: ".0*")
            hi = hi.replacingOccurrences(of: ".0.0", with: ".0")
            hi = hi.replacingOccurrences(of: ".1.0", with: ".1")
            hi = hi.replacingOccurrences(of: ".2.0", with: ".2")
            hi = hi.replacingOccurrences(of: ".3.0", with: ".3")
            hi = hi.replacingOccurrences(of: ".4.0", with: ".4")
            hi = hi.replacingOccurrences(of: ".5.0", with: ".5")
            hi = hi.replacingOccurrences(of: ".6.0", with: ".6")
            hi = hi.replacingOccurrences(of: ".7.0", with: ".7")
            hi = hi.replacingOccurrences(of: ".8.0", with: ".8")
            hi = hi.replacingOccurrences(of: ".9.0", with: ".9")
            print(hi)
            let expn = NSExpression(format:hi)
            var labe:Double = expn.expressionValue(with: nil, context: nil) as! Double
            label.text = String(describing: labe)
            operation = ""
            operation =  operation + String(labe.rounded(toPlaces: 1))
            
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
extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
