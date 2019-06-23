//
//  SearchViewController.swift
//  ReadIt
//
//  Created by Thara Nagaraj on 6/9/19.
//  Copyright © 2019 Thara Nagaraj. All rights reserved.
//

import UIKit
import SWXMLHash
import XMLMapper


class SearchViewController: UIViewController, XMLParserDelegate {

    @IBOutlet weak var searchTextField: UITextField!
    
    @objc func getText(_ sender: UITextField) throws{
        searchTextField.resignFirstResponder()
        let name = searchTextField.text!.trimmingCharacters(in: .whitespaces)
        
        var myUrl = "https://www.goodreads.com/api/author_url/" + name
        myUrl = myUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let url = URL(string: myUrl)!
        do{
            HTTPClient.request(url: url) { (result) in
                
                let author = XMLMapper<Author>().map(XMLString: result)
                let authorID = author?.id
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.addTarget(self, action: #selector(getText(_:)), for: .editingDidEndOnExit)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
