//
//  DetailViewController.swift
//  MathX
//
//  Created by Ler Yan En on 9/8/18.
//  Copyright © 2018 Zachary Sim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
   
    @IBOutlet var textView: UITextView!
     var masterView:NotesViewController!
    var text:String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        textView.text = text
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.becomeFirstResponder()
    }
    
    func setText(t:String) {
        text = t
        if isViewLoaded {
            textView.text = t
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        var test = textView.text.replacingOccurrences(of: "\n", with: "")
        masterView.newRowText = test
        textView.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
