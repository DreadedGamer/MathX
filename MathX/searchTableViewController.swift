//
//  searchTableViewController.swift
//  Changemakers_Designer_View
//
//  Created by Ler Yan En on 23/8/18.
//  Copyright © 2018 KWJX. All rights reserved.
//

import UIKit

class searchTableViewController: UITableViewController,UISearchBarDelegate{

    @IBOutlet var searchbar: UISearchBar!
    let data = ["hcf and lcm calculator","matrix","set language","quaratic equations","Grapher","Potractor","Trigo calculator"]
    
    var filteredData: [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredData = data
        searchbar.delegate = self
        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: data[indexPath.row])
        self.navigationController?.pushViewController(newViewController, animated: true)

    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = UITableViewCell(style: .default, reuseIdentifier: "hi")
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = filteredData[indexPath.row].capitalizingFirstLetter()
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = searchText.isEmpty ? data : data.filter({(dataString: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
class searchTableViewController2: UITableViewController,UISearchBarDelegate{
    
    @IBOutlet var searchbar: UISearchBar!
    let data = ["Prime Numbers, Highest Common Factor, Lowest Common Multiple","Algebraic Manipulation","Data Handling","Estimation and Approximation","Geometrical Constructions","Integers, Rational and Real Numbers","Linear Equations and Formula","Linear Functions and Graphs","Perimeter and Area of plane figures","Simple Inequalities","Direct and Inverse Proportions","Estimation and Approximation","Probability","Pythagoras Theorem and Trigonometry","Matrices","Set Language and Notation","Simultaneous Equations","Algebraic Expressions and Formulae","Graphs of Quadratic Functions","Equations and Inequalities","Equations and Inequalities","Congruency and Similarity"]
    
    var filteredData: [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredData = data
        searchbar.delegate = self
        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(data[indexPath.row], forKey: "Name")
        self.performSegue(withIdentifier: "show", sender: nil)
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "hi")
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = searchText.isEmpty ? data : data.filter({(dataString: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 79
    }
}
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}





