//
//  PaymentPageViewController.swift
//  onepay-ios-sdk
//
//  Created by ShagevanParameswaran on 27/7/20.
//  Copyright © 2020 ShagevanParameswaran. All rights reserved.
//

import UIKit
import WebKit

class PaymentPageViewController: UIViewController,WKWebScriptHandlerDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    var wkWebScriptHandler:WKWebScriptHandler!
    
    
    @IBAction func callJS(_ sender: Any) {
        
        var colorCode = "#6c0"
        
        webView.evaluateJavaScript("setTheme('\(colorCode)');", completionHandler: {(_, error) in
                    if((error) != nil) {
                        print(error?.localizedDescription ?? "")
                    } else {
                        
                        print("Success")
        
                    }
                })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundle = Bundle(for: type(of: self))
        
        let htmlPath = bundle.path(forResource: "paymentpage", ofType: "html")
        let url = URL(fileURLWithPath: htmlPath!)
        let request = URLRequest(url: url)
        
        // enable JS
        webView.configuration.preferences.javaScriptEnabled = true
        
        
        // Move out all script handling logic from view controller
        wkWebScriptHandler = WKWebScriptHandler(handlerforWebView: webView)
        wkWebScriptHandler.delegate = self
        wkWebScriptHandler.registerScriptsAndEvents()
        webView.load(request)
        webView.navigationDelegate = self
        // Do any additional setup after loading the view.
        
        
    }
    
    func sendData(message: String) {
        //Handle response from JS
    }
    
    
}

extension PaymentPageViewController:WKNavigationDelegate, WKUIDelegate {
    
    
    // MARK: Webview Navigation Delegates
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Swift.Void) {
        
        switch navigationAction.navigationType {
        case .linkActivated:
            // Navigate to any internal links clicked
            webView.load(navigationAction.request)
        case .reload:
            print("reloaded")
        default:
            break
        }
        decisionHandler(.allow)
    }
    // Handle alert
    public func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Swift.Void){
        
        let alertController = UIAlertController(title: message, message: nil,
                                                preferredStyle: .alert);
        
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel) {
            _ in completionHandler()}
        );
        
        self.present(alertController, animated: true, completion: {});
    }
    
    
    
}
