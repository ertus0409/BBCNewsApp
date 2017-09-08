//
//  MainVC.swift
//  NewsByBBC
//
//  Created by Guner Babursah on 31/07/2017.
//  Copyright © 2017 Guner Babursah. All rights reserved.
//

import UIKit
import Alamofire

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //IBOutlets:
    
    @IBOutlet weak var tableView: UITableView!
    
    var newsStore = [AnyObject]()
    var urlForDetails: String!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        callTheApi()
        
        
    }
    
    func callTheApi() {
        Alamofire.request("https://newsapi.org/v1/articles?source=bbc-news&sortBy=top&apiKey=4e3478e9851d41aaab3790957ad48dd5").responseJSON { response in
            
        let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let innerDict = dict["articles"]{
                    self.newsStore = innerDict as! [AnyObject]
                    print(self.newsStore)
                    self.tableView.reloadData()
                }
            }
            
        }
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsStore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
        
        let title = newsStore[indexPath.row]["title"]
        let def = newsStore[indexPath.row]["description"]
        
        cell?.titleLbl.text = title as? String
        cell?.defLbl.text = def as? String
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = newsStore[indexPath.row]["url"]
        urlForDetails = url as! String
        performSegue(withIdentifier: "segue", sender: NewsPage.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            let toNewsDetails = segue.destination as! NewsPage
            toNewsDetails.urlFromSegue = urlForDetails
            
        }
    }
    
    
    
    
    
    
    
    



}

