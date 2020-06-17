//
//  FifthViewController.swift
//  NewFinance
//
//  Created by Mario Perozo on 6/14/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import UIKit;
import SafariServices;

class FifthViewController: UIViewController {
     var financeDocument: FinanceDocument! = nil;
     var companyName : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let nameText: String = financeDocument.getName() else {
            print("The FinancialDocument had no name.");
            return;
        }
        
        companyName = "\(nameText)"
        
        var urlComponents: URLComponents = URLComponents();
        urlComponents.scheme = "https";
        urlComponents.host = "en.wikipedia.org"; //English
        urlComponents.path = "/wiki/\(companyName)";    //will change " " to "%20"

        guard let url: URL = urlComponents.url else {
            fatalError("could not create url for state \(companyName)");
        }

        let safariViewController: SFSafariViewController = SFSafariViewController(url: url);
        present(safariViewController, animated: true);
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        guard let nameText: String = financeDocument.getName() else {
            print("The FinancialDocument had no name.");
            return;
        }

        companyName = "\(nameText)"

        var urlComponents: URLComponents = URLComponents();
        urlComponents.scheme = "https";
        urlComponents.host = "en.wikipedia.org"; //English
        urlComponents.path = "/wiki/\(companyName)";    //will change " " to "%20"

        guard let url: URL = urlComponents.url else {
            fatalError("could not create url for state \(companyName)");
        }

        let safariViewController: SFSafariViewController = SFSafariViewController(url: url);
        present(safariViewController, animated: true);
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated);
//
//        guard let nameText: String = financeDocument.getName() else {
//            print("The FinancialDocument had no name.");
//            return;
//        }
//
//        companyName = "\(nameText)"
//
//        var urlComponents: URLComponents = URLComponents();
//        urlComponents.scheme = "https";
//        urlComponents.host = "en.wikipedia.org"; //English
//        urlComponents.path = "/wiki/\(companyName)";    //will change " " to "%20"
//
//        guard let url: URL = urlComponents.url else {
//            fatalError("could not create url for state \(companyName)");
//        }
//
//        let safariViewController: SFSafariViewController = SFSafariViewController(url: url);
//        present(safariViewController, animated: true);
//    }
    

}
