//
//  ThirdViewController.swift
//  NewFinance
//
//  Created by Mario Perozo on 6/12/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var cashFlowLabel: UILabel!
    @IBOutlet weak var investingCashFlowLabel: UILabel!
    
    var financeDocument: FinanceDocument! = nil;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let cashFlowText: String = financeDocument.getCashFlow() else {
            print("The FinancialDocument had no Cash Flow.");
            return;
        }
        
        cashFlowLabel.text = "Free cash flow is \(cashFlowText)"
        
        
        guard let investingCashFlowText: String = financeDocument.getInvestingCashFlow() else {
            print("The FinancialDocument had no Investing Cash Flow.");
            return;
        }
        
        investingCashFlowLabel.text = "USD \(investingCashFlowText)"
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        cashFlowLabel.text = ""
        investingCashFlowLabel.text = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        
        guard let cashFlowText: String = financeDocument.getCashFlow() else {
            print("The FinancialDocument had no Operating Cash Flow.");
            return;
        }
        cashFlowLabel.text = "USD \(cashFlowText)"
        
        guard let investingCashFlowText: String = financeDocument.getInvestingCashFlow() else {
            print("The FinancialDocument had no Investing Cash Flow.");
            return;
        }
        
        investingCashFlowLabel.text = "USD \(investingCashFlowText)"
        
    }
    
    
    
    
}
























/*
 
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
 
 */

