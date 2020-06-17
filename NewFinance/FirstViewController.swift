//
//  FirstViewController.swift
//  NewFinance
//
//  Created by Mario Perozo on 6/11/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var marketCapLabel: UILabel!
    @IBOutlet weak var peRatioLabel: UILabel!
    @IBOutlet weak var epsLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var tickerSymbol: String? = nil;
    var financeDocument: FinanceDocument! = nil;
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func returnButtonPressed(_ sender: UITextField) {
        tickerSymbol = sender.text
        sender.resignFirstResponder();
        
        activityIndicator.isHidden = true
        activityIndicator.startAnimating();
        financeDocument = FinanceDocument(tickerSymbol: tickerSymbol!);
        activityIndicator.stopAnimating();
        
        financeDocument = FinanceDocument(tickerSymbol: tickerSymbol!)
        
        if financeDocument == nil {
            print("Could not create instance of struct financeDocument.");
            return;
        }
        
        for viewController: UIViewController in tabBarController!.viewControllers!.dropFirst() {
            var vc: UIViewController = viewController;
            if let navigationController: UINavigationController = vc as? UINavigationController {
                vc = navigationController.viewControllers[0];
            }

            if let secondViewController: SecondViewController = vc as? SecondViewController {
                secondViewController.financeDocument = financeDocument;
            } else if let thirdViewController: ThirdViewController = vc as? ThirdViewController {
                thirdViewController.financeDocument = financeDocument;
            } else if let fourthViewController: FourthViewController = vc as? FourthViewController {
                fourthViewController.financeDocument = financeDocument;
            } else if let fifthViewController: FifthViewController = vc as? FifthViewController {
                fifthViewController.financeDocument = financeDocument;
            } else {
                print("unexpected type \(type(of: vc))");
            }
        }
        
        guard let nameText: String = financeDocument.getName() else {
            print("The FinancialDocument had no name.");
            return;
        }
        
        nameLabel.text = "\(nameText)"
        
        
        guard let price: Double = financeDocument.getPrice() else {
            print("The FinancialDocument had no price.");
            return;
        }
        
        priceLabel.text = String(format: "USD $%.2f", price);
        
        
        guard let marketCapText: String = financeDocument.getMarketCap() else {
            print("The FinancialDocument had no Market Cap.");
            return;
        }
        
        marketCapLabel.text = "USD \(marketCapText)"
        
        guard let peRatioText: String = financeDocument.getPERatio() else {
            print("The FinancialDocument had no PE Ratio.");
            return;
        }
        
        peRatioLabel.text = "\(peRatioText) Years. Share price / EPS"
        
        guard let epsText: String = financeDocument.getEPS() else {
            print("The FinancialDocument had no EPS.");
            return;
        }
        
        epsLabel.text = "USD \(epsText)"
        
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


