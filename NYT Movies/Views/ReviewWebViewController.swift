//
//  ReviewWebViewController.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/28/20.
//

import UIKit
import WebKit

class ReviewWebViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    var link: String
    
    init(with link: String) {
        self.link = link
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureToolbar() {
        navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(handleCloseButton))
    }
    
    @objc func handleCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func loadView() {
        let config = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: config)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureToolbar()
        loadUrl(self.link)
    }
    
    func loadUrl(_ link: String) {
        let site = URL(string: link)
        let req = URLRequest(url: site!)
        webView.load(req)
    }

}
