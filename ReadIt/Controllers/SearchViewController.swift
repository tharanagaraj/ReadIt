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
import WebKit


class SearchViewController: UIViewController, UISearchBarDelegate , WKUIDelegate, WKNavigationDelegate {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var webView: WKWebView!
    
//    @objc func getText(_ sender: UITextField) throws{
//        searchTextField.resignFirstResponder()
//        let name = searchTextField.text!.trimmingCharacters(in: .whitespaces)
//
//        var myUrl = "https://www.goodreads.com/api/author_url/" + name
//        myUrl = myUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//
//        let url = URL(string: myUrl)!
//        do{
//            HTTPClient.request(url: url) { (result) in
//
//                let author = XMLMapper<AuthorMetadata>().map(XMLString: result)
//                let authorID = author?.id
//
//            }
//        }
//    }
    
    
    override func loadView() {
        super.loadView()
        webView.navigationDelegate = self
        view.addSubview(webView)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {return}
        let authorName = text.trimmingCharacters(in: .whitespaces)
        var myUrl = "https://www.goodreads.com/api/author_url/" + authorName
        myUrl = myUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: myUrl)!
        self.showActivityIndicator(onView: self.view)
        do{
            HTTPClient.request(url: url) { (result) in
               
                let author = XMLMapper<AuthorMetadata>().map(XMLString: result)
                let authorID = author?.id
                self.getAuthorInfo(authorID : authorID!)
            }
        }
        
    }
    
    func getAuthorInfo(authorID: Int32){
        let authorURL = "https://www.goodreads.com/author/show.xml"
        let url = URL(string: authorURL)!
        do {
            HTTPClient.request(url: url, param: ["id" : String(authorID)]) { (result) in
               self.removeActivityIndicator()
               self.webView.loadHTMLString(result, baseURL: nil)
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
