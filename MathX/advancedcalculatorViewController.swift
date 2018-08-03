//
//  advancedcalculatorViewController.swift
//  MathX
//
//  Created by Ler Yan En on 3/8/18.
//  Copyright © 2018 Zachary Sim. All rights reserved.
//
import Expression
import UIKit

class advancedcalculatorViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var outputview: UITextView!
    @IBOutlet var inputField: UITextField!
    private var output = NSMutableAttributedString()
    var answerevalue = 0.0
    
    private func addOutput(_ string: String, color: UIColor) {
        let text = NSAttributedString(string: string + "\n\n", attributes: [
            NSAttributedStringKey.foregroundColor: color,
            NSAttributedStringKey.font: outputview.font!,
            ])
        
        output.replaceCharacters(in: NSMakeRange(0, 0), with: text)
        outputview.attributedText = output
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.append(outputview.attributedText)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if var text = textField.text, text != "" {
            text = text.replacingOccurrences(of: ")(", with: ")*(")
            text = text.replacingOccurrences(of: "--", with: "+")
            var st1ring = "+"
            var initial = text.count
            for y in 1 ... text.count{
                print(y)
                st1ring = "+"
                for x in 1 ... (initial-y+1){
                    st1ring = st1ring + "+"
                }
                print(st1ring)
                text = text.replacingOccurrences(of: st1ring, with: "+")
            }
            text = text.replacingOccurrences(of: "+-", with: "-")
            text = text.replacingOccurrences(of: "-+", with: "-")
            var before = text
            if(answerevalue != 0){
                text.lowercased()
            text = text.replacingOccurrences(of: "ans", with: String(answerevalue))
            }
            do {
                let result = try Expression(text).evaluate()
                answerevalue = result
                addOutput( before + String(format: " = %g", result) , color: .black)
            } catch {
                addOutput("\(error)", color: .red)
            }
        }
        return false
    }
    @IBAction func valuechanged(_ sender: Any) {
        if(inputField.text != "") && (inputField.text?.count)! > 1{
           var text = inputField.text
            print(text)
            var index = text?.index((text?.startIndex)!, offsetBy: (text?.count)! - 2)
            print(text?.count)
            print(String(text![index!]))
            print(text?.last)
            if(String((text?.last!)!) == "(" && (Int(String(text![index!])) != nil)){
                text = String((text?.dropLast())!)
                text = text! + "*("
                inputField.text = text
            }
        }
    }
    
}
