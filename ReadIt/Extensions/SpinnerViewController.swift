//
//  SpinnerViewController.swift
//  ReadIt
//
//  Created by Thara Nagaraj on 6/23/19.
//  Copyright © 2019 Thara Nagaraj. All rights reserved.
//

import UIKit

var spinner: UIView?

extension UIViewController{
    func showActivityIndicator(onView: UIView){
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
           spinnerView.addSubview(ai)
           onView.addSubview(spinnerView)
        }
        spinner = spinnerView
    }
    
    func removeActivityIndicator(){
        DispatchQueue.main.async {
            spinner?.removeFromSuperview()
            spinner = nil
        }
    }
}


