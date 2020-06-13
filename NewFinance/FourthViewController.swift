//
//  FourthViewController.swift
//  NewFinance
//
//  Created by Mario Perozo on 6/12/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    var tickerSymbol: String? = nil;
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //let address: String = "https://finance.yahoo.com/quote/IBM/profile?p=\(tickerSymbol!)";
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
        
        guard let descriptionText: String = companyProfileDocument.getDescription() else {
            print("The ComapanyProfileDocument had no description.");
            return;
        }
        
        descriptionLabel.text = "\(descriptionText)"
    }
    

    

}
