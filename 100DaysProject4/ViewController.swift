//
//  ViewController.swift
//  100DaysProject4
//
//  Created by Mark Falcone on 12/9/21.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        
        let url = URL(string: "https://hackingwithswift.com")!
        // this line wraps our hacking with swift url string in a URLRequest
        webView.load(URLRequest(url: url))
        //enables a property that allows users to swipe from left or right edge to move back or forward in a safari web browser
        webView.allowsBackForwardNavigationGestures = true
    }

    @objc func openTapped(){
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)// action sheet alows uses to choose a option
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        //this is important for iPads
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac,animated: true)
                     
    }
    
    func openPage(action: UIAlertAction){
        //let url = URL(string: "https://" + action.title!)!// we could wrap in guard let
        guard let actionTitle = action.title else{return}
        guard let url = URL(string: "https://" + actionTitle) else{return}
        webView.load(URLRequest(url: url))
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}

