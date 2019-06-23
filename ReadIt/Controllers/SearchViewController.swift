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


class SearchViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @objc func getText(_ sender: UITextField) throws{
        searchTextField.resignFirstResponder()
        let name = searchTextField.text!.trimmingCharacters(in: .whitespaces)
        
        var myUrl = "https://www.goodreads.com/api/author_url/" + name
        myUrl = myUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let url = URL(string: myUrl)!
        do{
            HTTPClient.request(url: url) { (result) in
                
                let author = XMLMapper<AuthorMetadata>().map(XMLString: result)
                let authorID = author?.id
                print(authorID)
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
//        searchTextField.addTarget(self, action: #selector(getText(_:)), for: .editingDidEndOnExit)
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {return}
        let authorName = text.trimmingCharacters(in: .whitespaces)
        var myUrl = "https://www.goodreads.com/api/author_url/" + authorName
        myUrl = myUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: myUrl)!
        do{
            HTTPClient.request(url: url) { (result) in
                
                let author = XMLMapper<AuthorMetadata>().map(XMLString: result)
                let authorID = author?.id
                print(authorID)
                
            }
        }
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
