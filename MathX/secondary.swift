//
//  secondary.swift
//  MathX
//
//  Created by Zachary Sim on 16/7/18.
//  Copyright © 2018 Zachary Sim. All rights reserved.
//

import UIKit

class secondary: UITableViewController {
    var secondarynotes : [Int:[notes]] = [
        
        1:
            [notes(title: "Prime Numbers, Highest Common Factor, Lowest Common Multiple", icon: "chapter1logo.png"),notes(title: "Algebraic Manipulation", icon: "chapter1logo.png"),notes(title: "Data Handling", icon: "chapter2logo.png"),notes(title: "Estimation and Approximation", icon: "chapter3logo.png"),notes(title: "Geometrical Constructions", icon: "chapter4logo.png"),notes(title: "Integers, Rational and Real Numbers", icon: "chapter4logo.png"),notes(title: "Linear Equations and Formula", icon: "chapter4logo.png"),notes(title: "Linear Functions and Graphs", icon: "chapter4logo.png"),notes(title: "Perimeter and Area of plane figures", icon: "chapter4logo.png"),notes(title: "Simple Inequalities", icon: "chapter4logo.png")],
        2:
            [notes(title: "Algebraic Expressions and Formulae", icon: "chapter1logo.png"),notes(title: "Graphs of Quadratic Functions", icon: "chapter2logo.png"),notes(title: "Simultaneous Equations", icon: "chapter3logo.png"),notes(title: "Equations and Inequalities", icon: "chapter3logo.png"),notes(title: "Matrices", icon: "chapter4logo.png"),notes(title: "Congruency and Similarity", icon: "chapter4logo.png"),notes(title: "Ratio and proportion", icon: "chapter4logo.png"),notes(title: "Direct and Inverse Proportions", icon: "chapter4logo.png"),notes(title: "Pythagoras Theorem and Trigonometry", icon: "chapter4logo.png"),notes(title: "Set Language and Notation", icon: "chapter4logo.png"),notes(title: "Probability", icon: "chapter4logo.png")],
        3:
            [notes(title: "Prime Numbers, Highest Common Factor, Lowest Common Multiple", icon: "chapter1logo.png"),notes(title: "Chapter 2", icon: "chapter2logo.png"),notes(title: "Chapter 3", icon: "chapter3logo.png"),notes(title: "Chapter 4", icon: "chapter4logo.png")],
        4:
            [notes(title: "Prime Numbers, Highest Common Factor, Lowest Common Multiple", icon: "chapter1logo.png"),notes(title: "Chapter 2", icon: "chapter2logo.png"),notes(title: "Chapter 3", icon: "chapter3logo.png"),notes(title: "Chapter 4", icon: "chapter4logo.png")],
    ]
    var index = UserDefaults.standard.integer(forKey: "index")
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
self.tableView.rowHeight = 89
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        var string : [String] = ["Secondary 1", "Secondary 2","Secondary 3","Secondary 4"]
        self.title = string[index-1]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    struct notes {
        var title:String
        var icon:String
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        self.tableView.rowHeight = 89
        return (secondarynotes[index]?.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        self.tableView.rowHeight = 89
        let titlelbl = cell.viewWithTag(1) as! UILabel
        titlelbl.adjustsFontSizeToFitWidth = false
        titlelbl.text = secondarynotes[index]![indexPath.row].title
        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(secondarynotes[index]![indexPath.row].title, forKey: "Name")
    }
    
    /*
     
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
