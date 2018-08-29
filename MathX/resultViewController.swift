//
//  resultViewController.swift
//  MathX
//
//  Created by Ler Yan En on 20/8/18.
//  Copyright © 2018 Zachary Sim. All rights reserved.
//

import UIKit
class resultViewController: UIViewController,UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Bundle.main.url(forResource: "GamesWithAnimals", withExtension: "pdf") {
            let name = UserDefaults.standard.string(forKey: "Name")
            let webView = UIWebView(frame: self.view.frame)
            let urlRequest = URLRequest(url: url)
            
            webView.loadRequest(urlRequest as URLRequest)
            webView.scalesPageToFit = true
            let pdfVC = self
            pdfVC.view.addSubview(webView)
            pdfVC.title = name
            webView.delegate = self
        }
        // Do any additional setup after loading the view.
    }
    
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool
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
