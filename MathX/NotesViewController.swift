//
//  NotesViewController.swift
//  MathX
//
//  Created by Zachary Sim on 5/3/18.
//  Copyright © 2018 Zachary Sim. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController,UITextFieldDelegate{
    @IBOutlet weak var notes: UITextView!
    
    @IBOutlet weak var DoneBtn: UIBarButtonItem!
    
    @IBAction func DoneBtnAction(_ sender: Any) {
  UserDefaults.standard.set(notes.text, forKey: "text")
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(UserDefaults.standard.string(forKey: "text") != nil){
        notes.text = UserDefaults.standard.string(forKey: "text")
        }
        // Do any additional setup after loading the view.
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
