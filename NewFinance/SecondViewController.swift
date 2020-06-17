//
//  SecondViewController.swift
//  NewFinance
//
//  Created by Mario Perozo on 6/12/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var assetsLabel: UILabel!
    @IBOutlet weak var liabilitiesLabel: UILabel!
    
    var financeDocument: FinanceDocument! = nil;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let assetsText: String = financeDocument.getAssets() else {
            print("The BalanceSheetDocument had no Assets.");
            return;
        }
        
        assetsLabel.text = "\(assetsText)"
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        assetsLabel.text = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        
        guard let assetsText: String = financeDocument.getAssets() else {
            print("The BalanceSheetDocument had no Assets.");
            return;
        }
        assetsLabel.text = "USD \(assetsText)"
        
        guard let liabilitiesText: String = financeDocument.showLiabilities() else {
            print("The BalanceSheetDocument had no Assets.");
            return;
        }
        liabilitiesLabel.text = "USD \(liabilitiesText)"
    }
    
}
























/*
 
 //let address: String = "https://finance.yahoo.com/quote/IBM/key-statistics?p=\(tickerSymbol!)";
 let address: String = "https://finance.yahoo.com/quote/IBM/balance-sheet?p=IBM";
 
 
 guard let url: URL = URL(string: address) else {
 print("Could not create URL from address \"\(address)\".");
 return;
 }
 
 guard let balanceSheetWebPage: String = textFromURL(url: url) else {
 print("Received nothing from URL \"\(url)\".");
 return;
 
 }
 
 guard let balanceSheetDocument: BalanceSheetDocument = BalanceSheetDocument(balanceSheetWebPage: balanceSheetWebPage) else {
 print("Could not create instance of struct BalanceSheetDocument.");
 return;
 }
 */
