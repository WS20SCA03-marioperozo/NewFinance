//
//  ThirdViewController.swift
//  NewFinance
//
//  Created by Mario Perozo on 6/12/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//



import UIKit

class ThirdViewController: UIViewController {
    
    var tickerSymbol: String? = nil;
    
    @IBOutlet weak var cashFlowLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let address: String = "https://finance.yahoo.com/quote/IBM/key-statistics?p=\(tickerSymbol!)";
        let address: String = "https://finance.yahoo.com/quote/IBM/cash-flow?p=IBM";
        
        
        guard let url: URL = URL(string: address) else {
            print("Could not create URL from address \"\(address)\".");
            return;
        }
        
        guard let cashFlowWebPage: String = textFromURL(url: url) else {
            print("Received nothing from URL \"\(url)\".");
            return;
            
        }
        
        guard let cashFlowStatementDocument: CashFlowStatementDocument = CashFlowStatementDocument(cashFlowWebPage: cashFlowWebPage) else {
            print("Could not create instance of struct CashFlowDocument.");
            return;
        }
        
        guard let cashFlowText: String = cashFlowStatementDocument.getCashFlow() else {
            print("The FinancialDocument had no Cash Flow.");
            return;
        }
        
        cashFlowLabel.text = "Free cash flow is \(cashFlowText)"
        
        
    }
    
    
}

