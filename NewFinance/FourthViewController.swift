//
//  FourthViewController.swift
//  NewFinance
//
//  Created by Mario Perozo on 6/12/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var financeDocument: FinanceDocument! = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        guard let descriptionText: String = financeDocument.getDescription() else {
            print("The ComapanyProfileDocument had no description.");
            return;
        }
        
        descriptionTextView.text = "\(descriptionText)"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        descriptionTextView.text = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        
        guard let descriptionText: String = financeDocument.getDescription() else {
            print("The ComapanyProfileDocument had no description.");
            return;
        }
        descriptionTextView.text = "\(descriptionText)"
    }
    

}























/*
 /let address: String = "https://finance.yahoo.com/quote/IBM/profile?p=\(tickerSymbol!)";
 let address: String = "https://finance.yahoo.com/quote/IBM/profile?p=IBM";
 
 guard let url: URL = URL(string: address) else {
     print("Could not create URL from address \"\(address)\".");
     return;
 }
 
 guard let descriptionWebPage: String = textFromURL(url: url) else {
     print("Received nothing from URL \"\(url)\".");
     return;
     
 }
 
 guard let companyProfileDocument: CompanyProfileDocument = CompanyProfileDocument(descriptionWebPage: descriptionWebPage) else {
     print("Could not create instance of struct CompanyProfileDocument.");
     return;
 }
 */
