//
//  AuthViewController.swift
//  Spotify
//
//  Created by ousmane diouf on 3/10/21.
//

import UIKit
import WebKit

class AuthViewController: UIViewController {
    

//MARK: - UIComponents

private let webView: WKWebView =  {
    let prefs =  WKWebpagePreferences()
    prefs.allowsContentJavaScript  = true
    let config =  WKWebViewConfiguration()
    config.defaultWebpagePreferences = prefs
    let webView = WKWebView(frame: .zero, configuration: config)
    return webView
    
}()
    
//MARK: - properties
public var completionHandler: ((Bool) -> Void)? // communicates success of signing in

    
    
//MARK: View LifeCycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign In"
        view.backgroundColor = .systemBackground
        webView.navigationDelegate =  self //notifies when the pagees load
        view.addSubview(webView)
        guard let url =  AuthManager.shared.signInURL else { return}
        webView.load(URLRequest(url: url))

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url =  webView.url else { return }
        
        //exchange the code that spotify gives for access token
        ///get the parameter from the URL if there  is one. to acheieve that we use url component
        
        guard let code = URLComponents(string: url.absoluteString)?.queryItems?.first(where: {$0.name ==  "code"})?.value else { return }
        print("\(code)")
    }

}

//Helper Functions



extension AuthViewController: WKNavigationDelegate {
    
}
