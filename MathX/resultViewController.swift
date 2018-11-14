//
//  resultViewController.swift
//  MathX
//
//  Created by Ler Yan En on 20/8/18.
//  Copyright © 2018 Zachary Sim. All rights reserved.
//

import UIKit
import AVKit
class resultViewController: UIViewController,UIWebViewDelegate {
    @IBOutlet var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = UserDefaults.standard.string(forKey: "Name")
        print(name)
        self.title = name
        //testing only
//        if(name == "Prime Numbers, Highest Common Factor, Lowest Common Multiple"){
//            fileformat = "html"
//        }
//        if(name == "Equations and Inequalities"){
//            fileformat = "html"
//        }
        if(isKeyPresentInUserDefaults(key:"isfirstime") != true){
            UserDefaults.standard.set(true, forKey: "isfirstime")
        showAlert()
        }
        if let url = Bundle.main.url(forResource: name, withExtension: ".html",subdirectory: name) {
            let webView = UIWebView(frame: self.view.frame)
            let urlRequest = URLRequest(url: url)
            
            
            webView.loadRequest(urlRequest as URLRequest)
            webView.scalesPageToFit = true
            webView.scrollView.setZoomScale(-10, animated: true)
            let pdfVC = self
            pdfVC.view.addSubview(webView)
            pdfVC.title = name
            webView.delegate = self
            webView.dataDetectorTypes.remove(UIDataDetectorTypes.all)
        }else{
            print("error")
            print(Bundle.main.url(forResource: name, withExtension: "pdf"))
            alert(message: "Error", title: "File not found")
        }
        
        // Do any additional setup after loading the view.
    }
    func showAlert() {
        let alert = UIAlertController(title: "Tip", message: "Double tap to zoom in", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { _ in alert.dismiss(animated: true, completion: nil)} )
    }
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activity.stopAnimating()
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        activity.startAnimating()
        
    }
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool
    {
        
        if navigationType == .linkClicked
        {
          print(request)
            return  false
        
        }
        return true
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
