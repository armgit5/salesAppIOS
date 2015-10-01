//
//  WebViewController.swift
//  NilpeterSalesApp
//
//  Created by Yuttanant Suwansiri on 9/30/2558 BE.
//  Copyright © 2558 Arm Suwansiri. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet var webView: UIWebView!
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet var loadingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor.redColor()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let url = NSURL(string: "http://arm-calendar-apitest.herokuapp.com/ioscalendar")
        let request = NSURLRequest(URL: url!)
        webView.delegate = self
        webView.loadRequest(request)
    }
    
    func hideLoading() {
        loadingIndicator.stopAnimating()
        loadingIndicator.hidden = true
        loadingLabel.hidden = true
    }
    
    func showLoading() {
        loadingIndicator.startAnimating()
        loadingIndicator.hidden = false
        loadingLabel.hidden = false
    }
    
    func webViewDidStartLoad(webView: UIWebView)
    {
        print("webViewDidStartLoad")
        showLoading()
    }
    
    func webViewDidFinishLoad(webView: UIWebView)
    {
        print("webViewDidFinishLoad")
        hideLoading()
        
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?)
    {
        print("An error occurred while loading the webview")
    }

}
