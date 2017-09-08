//
//  N{ewsPage.swift
//  NewsByBBC
//
//  Created by Guner Babursah on 02/08/2017.
//  Copyright © 2017 Guner Babursah. All rights reserved.
//

import UIKit

class NewsPage: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var urlFromSegue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlForNews: URL = URL(string: urlFromSegue!)!
        webView.loadRequest(URLRequest(url: urlForNews))
        

        
    }

}
