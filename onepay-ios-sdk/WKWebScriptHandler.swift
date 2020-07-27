//
//  WKWebScriptHandler.swift
//  onepay-sdk-ios
//
//  Created by ShagevanParameswaran on 23/7/20.
//  Copyright © 2020 ShagevanParameswaran. All rights reserved.
//

import UIKit
import WebKit

protocol WKWebScriptHandlerDelegate {
    func sendData(message: String)
}

class WKWebScriptHandler: NSObject, WKScriptMessageHandler {
    
    var wkWebView:WKWebView!
    var delegate: WKWebScriptHandlerDelegate?
    // Events to listen
    let events = ["test","sizeNotification"]
    init(handlerforWebView webView : WKWebView){
        wkWebView = webView
        super.init()
    }
    // MARK: Set up script handlers
    func registerScriptsAndEvents() {
        
        let controller = self.wkWebView.configuration.userContentController
        for event in events {
            controller.add(self, name: event)
        }
        // Load the entire script to the document
        //controller.addUserScript(fetchScript())
    }
    // Script call back. The call backs for the vevents that ypu listen to , here I listen to "postascript","sizeNotification"
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage){
        
        if message.name == "test", let messageBody = message.body as? String {
            print(messageBody)
            self.delegate?.sendData(message: messageBody)
            //wkWebView.evaluateJavaScript("openAndroidDialog()", completionHandler: nil)
        }
        
    }
    
}
