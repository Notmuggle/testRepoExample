//
//  WebViewViewController.swift
//  testOneApp
//
//  Created by Anika Tomichen on 26/07/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit
import WebKit


class WebViewViewController: UIViewController {

    @IBOutlet weak var baseView: UIView!
    
    var webView: WKWebView!
    var webLink: String?
    
    
    class func instantiateFromStoryboard() -> WebViewViewController {
        let storyboard = UIStoryboard(name: "websitePresenter", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! WebViewViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initWebView()
        
        
        if let url:URL = Bundle.main.url(forResource: "search", withExtension: "html"){
        webView.loadFileURL(url, allowingReadAccessTo: url)
        let request = URLRequest(url: url)
        webView.load(request)
        }
    }
    
    private func initWebView() {
        let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
        webView.navigationDelegate = self
        baseView.addSubview(webView)
        self.webView = webView
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 9.0, *) {
            webView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 0).isActive = true
            
            webView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: 0).isActive = true
            
            webView.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 0).isActive = true
            
            webView.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: 0).isActive = true
            
        } else {
            // Fallback on earlier versions
        }
        
    }
    

    @IBAction func closeButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension WebViewViewController: WKUIDelegate, WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
}

