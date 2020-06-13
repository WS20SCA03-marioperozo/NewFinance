//
//  FirstViewController.swift
//  NewFinance
//
//  Created by Mario Perozo on 6/11/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var tickerSymbol: String? = nil;
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var marketCapLabel: UILabel!
    @IBOutlet weak var peRatioLabel: UILabel!
    @IBOutlet weak var epsLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender);
    print("preparing to segue from \(type(of: segue.source)) to \(type(of: segue.destination))");
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func returnButtonPressed(_ sender: UITextField) {
        tickerSymbol = sender.text
        sender.resignFirstResponder();
        
        let address: String = "https://finance.yahoo.com/quote/\(tickerSymbol!)";
        
        
        guard let url: URL = URL(string: address) else {
            print("Could not create URL from address \"\(address)\".");
            return;
        }
        
        guard let webPage: String = textFromURL(url: url) else {
            print("Received nothing from URL \"\(url)\".");
            return;
            
        }
        
        guard let incomeStatementDocument: IncomeStatementDocument = IncomeStatementDocument(webPage: webPage) else {
            print("Could not create instance of struct IncomeStatementDocument.");
            return;
        }
        
        guard let nameText: String = incomeStatementDocument.getName() else {
            print("The FinancialDocument had no name.");
            return;
        }
        
        nameLabel.text = "The company name is \(nameText)"
        
        
        guard let price: Double = incomeStatementDocument.getPrice() else {
            print("The FinancialDocument had no price.");
            return;
        }
        
        priceLabel.text = String(format: "The current price of \(tickerSymbol!) stock is USD $%.2f", price);
        
        
        guard let marketCapText: String = incomeStatementDocument.getMarketCap() else {
            print("The FinancialDocument had no Market Cap.");
            return;
        }
        
        marketCapLabel.text = "The Market Capitalization of \(nameText) is \(marketCapText)"
        
        guard let peRatioText: String = incomeStatementDocument.getPERatio() else {
            print("The FinancialDocument had no PE Ratio.");
            return;
        }
        
        peRatioLabel.text = "The PE Ratio of \(nameText) is \(peRatioText)"
        
        guard let epsText: String = incomeStatementDocument.getEPS() else {
            print("The FinancialDocument had no EPS.");
            return;
        }
        
        epsLabel.text = "The EPS of \(nameText) is \(epsText)"
        
    }
    
    
    
}



func textFromURL(url: URL) -> String? {
    let semaphore: DispatchSemaphore = DispatchSemaphore(value: 0);
    var result: String? = nil;
    
    let value: String = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.1 Safari/605.1.15";
    
    var request: URLRequest = URLRequest(url: url);     request.addValue(value, forHTTPHeaderField: "User-Agent");
    
    let task: URLSessionDataTask = URLSession.shared.dataTask(with: request) {(data: Data?, response: URLResponse?, error: Error?) in
        if let error: Error = error { //I hope this if is false.
            print(error);
        }
        if let hTTPURLResponse: HTTPURLResponse = response as? HTTPURLResponse {
            if !(200 ..< 300).contains(hTTPURLResponse.statusCode) { //I hope this if is false.
                print("bad status code \(hTTPURLResponse.statusCode)")
            }
        } else {
            print("Response was of type \(type(of: response)), not HTTPURLResponse)");
            return;
        }
        if let data: Data = data {    //I hope this if is true.
            result = String(data: data, encoding: String.Encoding.utf8);
        }
        semaphore.signal();   //Cause the semaphore's wait method to return.
    }
    
    task.resume();    //Try to download the web page into the Data object, then execute the closure.
    semaphore.wait(); //Wait here until the download and closure have finished executing.
    return result;    //Do this return after the closure has finished executing.
}

