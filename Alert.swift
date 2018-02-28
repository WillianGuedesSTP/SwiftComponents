//
//  Alert.swift
//  Antena1
//
//  Created by Willian Guedes da Silva Cunha  on 28/02/18.
//  Copyright © 2018 Poggers Soluções Ageis em TI. All rights reserved.
//

import Foundation
import UIKit

class Alert{
    
    /* Name: spinnerAlert
     * Main Action: Create a simple spinner alert, with custom message.
     * @Parameters: This function also need your message.
     * @Return: This function returns a basic alert with spinner.
     */
    
    class func spinnerAlert(message: String) -> UIAlertController{
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        return alert
    }
}

