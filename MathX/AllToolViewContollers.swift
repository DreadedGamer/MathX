//
//  AllToolViewContollers.swift
//  MathX
//
//  Created by Ler Yan En on 22/8/18.
//  Copyright © 2018 Zachary Sim. All rights reserved.
//

import UIKit
class geogebra: UIViewController {

    @IBOutlet var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Grapher"
        do {
            guard let filePath = Bundle.main.path(forResource: "graphing-template-beta", ofType: "html")
                else {
                    // File Error
                    print ("File reading error")
                    return
            }
            
            let contents =  try String(contentsOfFile: filePath, encoding: .utf8)
            let baseUrl = URL(fileURLWithPath: filePath)
            webview.loadHTMLString(contents as String, baseURL: baseUrl)
        }
        catch {
            print ("File HTML error")
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
class sets: UIViewController {
    @IBOutlet var select: UISegmentedControl!
    @IBOutlet var set_a: UITextField!
    @IBOutlet var set_b: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet var result: UITextView!
    @IBAction func submit(_ sender: Any) {
        let setatext : Set = Set(set_a.text!.components(separatedBy: ","))
        let setbtext : Set = Set(set_b.text!.components(separatedBy: ","))
        if(setatext != nil && setbtext != nil){
            if(select.selectedSegmentIndex == 0){
                result.text = String(setatext.union(setbtext))
            }else if(select.selectedSegmentIndex == 1){
                result.text = String(setatext.intersection(setbtext))
            }else if(select.selectedSegmentIndex == 2){
                result.text = String(setatext.isSubset(of: setbtext))
            }
        }
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
class lcmandhcf: UIViewController {
    
    @IBOutlet var number1: UITextField!
    @IBOutlet var number: UITextField!
    @IBOutlet var select: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func Calcualte(_ sender: Any) {
        if(Int(number1.text!) != nil && Int(number.text!) != nil){
        if(select.selectedSegmentIndex == 0){
           alert(message: String(lcm(num1: Int(number.text!)!, num2: Int(number.text!)!)))
            
        }else if(select.selectedSegmentIndex == 1){
            alert(message: String(hcf(num1: Int(number.text!)!, num2: Int(number.text!)!)))
        }
        else if(select.selectedSegmentIndex == 2){
            alert(message: String(gcd(num1: Int(number.text!)!, num2: Int(number.text!)!)))
        }
        }
    }
    func hcf(num1: Int, num2: Int) -> Int {
        var numA = num1
        var numB = num2
        while numA != 0 && numB != 0 {
            if numA >= numB {
                numA %= numB
            } else {
                numB %= numA
            }
        }
        return max(numA, numB)
    }
    func gcd(num1: Int, num2: Int) -> Int {
        if num2 == 0 {
            return num1
        }else {
            return gcd(num1: num2, num2: num1 % num2)
        }
    }
    func lcm(num1: Int, num2: Int) -> Int {
        return num1 * num2 / gcd(num1: num1, num2: num2)
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
class Matrix: UIViewController {
    
    @IBOutlet var matrixa: UITextField!
    @IBOutlet var rowmatrixa: UITextField!
    @IBOutlet var matrixb: UITextField!
    @IBOutlet var rwomatrixb: UITextField!
    
    @IBOutlet var answere: UITextView!
    var matrixA = [[Int]]()
    
    
    var matrixB = [[Int]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func submit(_ sender: Any) {
        print("New:")
        matrixA = []
        matrixB = []
        if(matrixa.text != "" && matrixb.text != "" && Int(rowmatrixa.text!) != nil && Int(rwomatrixb.text!) != nil){
            var mata = matrixa.text?.components(separatedBy: ",").map { Int($0)!}
            print((mata?.count)! % Int(rowmatrixa.text!)!)
            if((mata?.count)! % Int(rowmatrixa.text!)! == 0){
        var initial = 0
                var deivide = (mata?.count)! / Int(rowmatrixa.text!)!
                print(deivide)
                for _ in 1 ... deivide{
                    var lol:[Int] = []
                    for _ in 0 ... Int(rowmatrixa.text!)! - 1{
                        lol.append(mata![initial])
                        initial =  initial + 1
                    }
                    matrixA.append(lol)
                }
                mata = matrixb.text?.components(separatedBy: ",").map { Int($0)!}
                initial = 0
                deivide = (mata?.count)! / Int(rwomatrixb.text!)!
                print(deivide)
                for _ in 1 ... deivide{
                    var lol:[Int] = []
                    for _ in 0 ... Int(rwomatrixb.text!)! - 1{
                        lol.append(mata![initial])
                        initial =  initial + 1
                    }
                    print(lol)
                    matrixB.append(lol)
                }
                
        prettyPrintMatrix( matrixA)
     let result = multiply( matrixA, matrixB )
      print( "Result:")
        prettyPrintMatrix(result)
                print(prettyMatrixdisplay(result))
                if(result.isEmpty){
                    answere.text = "Illegal matrix dimensions!"
                }else{
        answere.text = prettyMatrixdisplay(result)
                }
            }else{
                print("error1")
            }
        }else{
            print("error2")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func prettyPrintMatrix( _ matrix:[[Int]] ) {
        print("Matrix:")
        for array in matrix {
            
            print( array )
        }
    }
    func prettyMatrixdisplay( _ matrix:[[Int]])-> String {
        var final = ""
        
        for array in matrix {
            final.append("[")
            for i  in array{
         final.append(String(i) + ",")
            }
            final.append("]")
           final.append("\n")
        }
        return final
    }
    func multiply( _ matrixA:[[Int]], _ matrixB:[[Int]]) -> [[Int]] {
        
        if matrixA[ 0 ].count != matrixB.count {
            
            print( "Illegal matrix dimensions!" )
            return [[]] // returns empty matrix
        }
        
        let size = matrixA.count
        
        var result:[[Int]] = [[Int]]( repeating: [Int]( repeating: 0, count: size ), count: size )
        
        for i in 0..<result.count {
            for j in 0..<matrixB.count {
                for k in 0..<matrixB[0].count {
                    result[i][k] += matrixA[i][j] * matrixB[j][k]
                }
            }
        }
        
        return result
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
class twodarea: UIViewController {
    let shape = CAShapeLayer()
    let path = UIBezierPath()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.addSublayer(shape)
        shape.opacity = 0.5
        shape.lineWidth = 2
        shape.lineJoin = kCALineJoinMiter
        shape.strokeColor = UIColor(hue: 0.786, saturation: 0.79, brightness: 0.53, alpha: 1.0).cgColor
        shape.fillColor = UIColor(hue: 0.786, saturation: 0.15, brightness: 0.89, alpha: 1.0).cgColor
        path.move(to: CGPoint(x: 0, y: 0))
        // Do any additional setup after loading the view.
    }
    var corordinates :[CGPoint]=[]
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.view)
        path.removeAllPoints()
        
        if(corordinates.count == 0){
            path.move(to: location)
            drawdot(location: location)
        }else{
            path.move(to: corordinates[0])
            drawdot(location: location)
        }
        corordinates.append(location)
        
       
        for i in corordinates{
            print(i)
           path.addLine(to: i)
            drawdot(location: location)
        }
        path.close()
        shape.path = path.cgPath
    }
    func drawdot (location:CGPoint){
        let circlePath = UIBezierPath(arcCenter: location, radius: CGFloat(10), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.gray.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = UIColor.red.cgColor
        //you can change the line width
        shapeLayer.lineWidth = 3.0
        
        view.layer.addSublayer(shapeLayer)
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
extension UIViewController {
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
