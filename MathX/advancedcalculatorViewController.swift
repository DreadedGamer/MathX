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
        if let text = textField.text, text != "" {
            do {
                let result = try Expression(text).evaluate()
                addOutput(String(format: "= %g", result), color: .black)
            } catch {
                addOutput("\(error)", color: .red)
            }
        }
        return false
    }

}
