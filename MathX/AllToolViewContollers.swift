//
//  AllToolViewContollers.swift
//  MathX
//
//  Created by Ler Yan En on 22/8/18.
//  Copyright © 2018 Zachary Sim. All rights reserved.
//

import UIKit
import WebKit
import AVKit
class geogebra: UIViewController,WKUIDelegate,WKNavigationDelegate {
    @IBOutlet var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Grapher"
            let url = URL(string: "https://www.desmos.com/api/v1.1/docs/examples/fullscreen.html")
            let request = URLRequest(url: url!)
            webview.load(request)
        webview.uiDelegate = self
        webview.navigationDelegate = self
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    @IBOutlet var activity: UIActivityIndicatorView!
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        alert(message: String(describing: error))
        activity.stopAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.stopAnimating()
        print("loaded")
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
class radomise: UIViewController,UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate {
    
    // reset does not reset summary section
    var array = [Int:Int]()
    var total = 0.0
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "hi")
        print(array)
 
        if(segmented.selectedSegmentIndex == 0){
            cell.textLabel?.text = String(indexPath.row+1) + ")" + String(data[indexPath.row])
        }else{
            if(array[indexPath.row + 1] != nil){
                let percentage = String(((Double(array[indexPath.row + 1]!) / total) * 100).rounded(toPlaces: 3)) + "%"
                cell.textLabel?.text = String(indexPath.row + 1) + "'s Occurrences - " + String(array[indexPath.row + 1]!) + " Percentage- " + percentage
                print(array)
            }else{
                cell.textLabel?.adjustsFontSizeToFitWidth = true
                cell.textLabel?.text = String(indexPath.row + 1) + "'s Occurrences - 0 Percentage- 0%"
                
            }
          
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var name = "Datapoints"
        if(segmented.selectedSegmentIndex == 0){
            name = "Datapoints"
        }else{
            name = "Summary"
        }
        return name
    }
    var data : [Int] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(segmented.selectedSegmentIndex == 0){
            return data.count
        }else{
            return Int(maxnumber.text!) ?? 0
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    @IBAction func changed(_ sender: Any) {
        tableview.reloadData()
    }
    @IBAction func havechanged(_ sender: Any) {
        total = 0.0
        data.removeAll()
        array.removeAll()
        tableview.reloadData()
    }
    
    
    
    

    @IBOutlet var number: UILabel!
    
    @IBOutlet var segmented: UISegmentedControl!
    @IBOutlet var maxnumber: UITextField!
    @IBOutlet var tableview: UITableView!
    @IBAction func touched(_ sender: Any) {
        
        if(UInt32(maxnumber.text!) != nil && Int(maxnumber.text!)! > 0){
            
            let randomInt = Int(arc4random_uniform(UInt32(maxnumber.text!)!) + 1)
        data.append(randomInt)
        number.text = String(randomInt)
            if array[randomInt] != nil {
                array[randomInt] = array[randomInt]! + 1
                let indexPath = IndexPath(item: randomInt - 1, section: 0)
                tableview.reloadData()
            }else{
                array[randomInt] = 1
                tableview.reloadData()
            }
            total = total + 1
        
        }else{
            alert(message: "Error imput")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    override func viewDidLoad() {
        self.title = "Probability"
        maxnumber.delegate = self
      tableview.dataSource = self
        tableview.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(addTapped2))
        
        // Do any additional setup after loading the view.
    }
    @objc func addTapped2(){
        maxnumber.text = "2"
        number.text = "0"
        array.removeAll()
        total = 0.0
        data.removeAll()
        tableview.reloadData()
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
class trigo: UIViewController{
    @IBOutlet var a: UITextField!
    @IBOutlet var b: UITextField!
    @IBOutlet var c: UITextField!
    var count = 0
    var x = RightTriangle(length: 0, width: 0)
    var missingvalue = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.title = "Trigo calculator"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func update(_ sender: Any) {
     
        if(Int(a.text!) != nil){
            count = count + 1
            x = RightTriangle(length: Double(a.text!)!, width: x.width)
            
        }else{
            missingvalue = "a"
        }
        print(x)
        if(Int(b.text!) != nil){
            count = count + 1
            x = RightTriangle(length: x.length, width: Double(b.text!)!)
        }else{
            missingvalue = "b"
        }
        print(x)
        if(Int(c.text!) != nil){
            count = count + 1
           x.hypotenuse = Double(c.text!)!
            
        }else{
          missingvalue = "c"
        }
        if(count == 2){
            print(x)
            if(missingvalue == "a"){
             a.text = String(x.length)
            }else if(missingvalue == "b"){
               b.text = String(x.width)
            }else if(missingvalue == "c"){
               c.text = String(x.hypotenuse)
            }
        }else if(count == 3){
            alert(message: "No unknown")
        }else{
            alert(message: "Error")
        }
        count = 0
    }
    
    struct RightTriangle: CustomStringConvertible {
        private var _length: Double
        private var _width: Double
        
        var length: Double {
            get {
                return _length
            }
            set {
                let h = self.hypotenuse
                _length = newValue
                _width = sqrt(h * h - _length * _length)
            }
        }
        
        var width: Double  {
            get {
                return _width
            }
            set {
                let h = self.hypotenuse
                _width = newValue
                _length = sqrt(h * h - _width * _width)
            }
            
        }
        
        var hypotenuse: Double {
            get {
                return sqrt(length * length + width * width)
            }
            set {
                _width = sqrt((newValue * newValue) - (length * length))
            }
        }
        
        init(length: Double, width: Double) {
            _length = length
            _width = width
        }
        
        var description: String {
            return "length = \(length), width = \(width), hypotenuse = \(hypotenuse)"
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
import Accelerate
import simd
typealias LAInt = __CLPK_integer
class simuleqn: UIViewController {
    @IBOutlet var first_equation_x: UITextField!
    @IBOutlet var first_equation_result: UITextField!
    @IBOutlet var first_equation_y: UITextField!
    @IBOutlet var second_equation_x: UITextField!
    @IBOutlet var second_equation_y: UITextField!
    @IBOutlet var second_equation_result: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submit(_ sender: Any) {
        if(Int(first_equation_x.text!) != nil && Int(first_equation_y.text!) != nil && Int(first_equation_result.text!) != nil && Int(second_equation_x.text!) != nil && Int(second_equation_y.text!) != nil && Int(second_equation_result.text!) != nil && Int(first_equation_x.text!) != nil){
            
            //equation 1
            
            //(first_equation_y * second_equation_x)
            //(first_equation_result * second_equation_x)
            
            //equation 2
            
           //(second_equation_y * first_equation_x)
            //(second_equation_result * first_equation_x)
            
            //eliminate x
            //Result:
            //(second_equation_result * first_equation_x) - (first_equation_result * second_equation_x):y
            //(second_equation_y * first_equation_x)- (first_equation_y * second_equation_x):result
            
            //eavaluate y
            //(second_equation_y * first_equation_x)- (first_equation_y * second_equation_x)/(second_equation_result * first_equation_x) - (first_equation_result * second_equation_x):y
            
            //evaluate x(substitution)
            
            //(first_equation_result- y * first_equation_y)/first_equation_x
            
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
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
class potractor: UIViewController,AVCaptureVideoDataOutputSampleBufferDelegate {
    
    let captureSession = AVCaptureSession()
    var previewLayer:CALayer!
    
    var captureDevice:AVCaptureDevice!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareCamera()
    }
    
    
    func prepareCamera() {
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
        let availableDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back).devices
            captureDevice = availableDevices.first
        
            beginSession()
        
        
    }
    @IBOutlet var image: UIImageView!
    
    @IBOutlet var label: UILabel!
    func beginSession () {
        if(captureDevice != nil){
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice)
            
            captureSession.addInput(captureDeviceInput)
            
        }catch {
            print(error.localizedDescription)
        }
        
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            self.previewLayer = previewLayer
            self.view.layer.addSublayer(self.previewLayer)
        view.bringSubviewToFront(image)
            view.bringSubviewToFront(label)
            self.previewLayer.frame = self.view.layer.frame
            captureSession.startRunning()
            
            let dataOutput = AVCaptureVideoDataOutput()
            dataOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as NSString):NSNumber(value:kCVPixelFormatType_32BGRA)] as [String : Any]
            
            dataOutput.alwaysDiscardsLateVideoFrames = true
            
            if captureSession.canAddOutput(dataOutput) {
                captureSession.addOutput(dataOutput)
            }
            
            captureSession.commitConfiguration()
            
            
            let queue = DispatchQueue(label: "com.brianadvent.captureQueue")
            dataOutput.setSampleBufferDelegate(self, queue: queue)
            
            
            
        
        }else{
            alert(message: "Error")
        }
    }
    
    
    
    
    
    
    func stopCaptureSession () {
        self.captureSession.stopRunning()
        
        if let inputs = captureSession.inputs as? [AVCaptureDeviceInput] {
            for input in inputs {
                self.captureSession.removeInput(input)
            }
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let screenSize = previewLayer.bounds.size
        if let touchPoint = touches.first {
            let x = touchPoint.location(in: self.view).y / screenSize.height
            let y = 1.0 - touchPoint.location(in: self.view).x / screenSize.width
            let focusPoint = CGPoint(x: x, y: y)
            
            if let device = captureDevice {
                do {
                    try device.lockForConfiguration()
                    
                    device.focusPointOfInterest = focusPoint
                    //device.focusMode = .continuousAutoFocus
                    device.focusMode = .autoFocus
                    //device.focusMode = .locked
                    device.exposurePointOfInterest = focusPoint
                    device.exposureMode = AVCaptureDevice.ExposureMode.continuousAutoExposure
                    device.unlockForConfiguration()
                }
                catch {
                    // just ignore
                }
            }
        }
    }
    
}


class sets: UIViewController {
    @IBOutlet var select: UISegmentedControl!
    @IBOutlet var set_a: UITextField!
    @IBOutlet var set_b: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    @IBOutlet var result: UITextView!
    @IBAction func submit(_ sender: Any) {
        let setatext : Set = Set(set_a.text!.components(separatedBy: ","))
        let setbtext : Set = Set(set_b.text!.components(separatedBy: ","))
        if(setatext != nil && setbtext != nil){
            if(select.selectedSegmentIndex == 0){
                result.text = [String](setatext.union(setbtext)).description
            }else if(select.selectedSegmentIndex == 1){
                result.text = [String](setatext.intersection(setbtext)).description
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
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    @IBAction func Calcualte(_ sender: Any) {
        if(Int(number1.text!) != nil && Int(number.text!) != nil && Int(number.text!) != 0 && Int(number.text!) != 0){
        if(select.selectedSegmentIndex == 0){
           alert(message: String(lcm(num1: Int(number1.text!)!, num2: Int(number.text!)!)))
            
        }else if(select.selectedSegmentIndex == 1){
            alert(message: String(hcf(num1: Int(number1.text!)!, num2: Int(number.text!)!)))
        }
        else if(select.selectedSegmentIndex == 2){
            alert(message: String(gcd(num1: Int(number1.text!)!, num2: Int(number.text!)!)))
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
        self.hideKeyboardWhenTappedAround()
        
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
                    answere.text = prettyMatrixdisplay(result).replacingOccurrences(of: ",]", with: "]")
                }
            }else{
                alert(message: "Error")
                print("error1")
            }
        }else{
            alert(message: "Error")
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
            alert(message: "Illegal matrix dimensions!")
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
        shape.lineJoin = CAShapeLayerLineJoin.miter
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


