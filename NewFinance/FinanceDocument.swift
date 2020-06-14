//
//  FinancialDocument.swift
//  NewFinance
//
//  Created by Mario Perozo on 6/11/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import Foundation;
import SwiftSoup;

struct FinanceDocument {
    let document1: Document;
    let document2: Document;
    let document3: Document;
    let document4: Document;

    init?(tickerSymbol: String) {   //failable initializer
        
        let address1: String = "https://finance.yahoo.com/quote/\(tickerSymbol)";
        let address2: String = "https://finance.yahoo.com/quote/\(tickerSymbol)/balance-sheet?p=\(tickerSymbol)";
        let address3: String = "https://finance.yahoo.com/quote/\(tickerSymbol)/cash-flow?p=\(tickerSymbol)";
        let address4: String = "https://finance.yahoo.com/quote/\(tickerSymbol)/profile?p=\(tickerSymbol)";
        
        guard let url1: URL = URL(string: address1) else {
            print("Could not create URL from address \"\(address1)\".");
            return nil;
        }
        
        guard let webPage1: String = textFromURL(url: url1) else {
            print("Received nothing from URL \"\(url1)\".");
            return nil;
            
        }
        
        guard let document1: Document = try? SwiftSoup.parse(webPage1) else {
            print("Could not parse webPage1.");
            return nil;
        }
        self.document1 = document1;
        
        guard let url2: URL = URL(string: address2) else {
            print("Could not create URL from address \"\(address2)\".");
            return nil;
        }
        
        guard let webPage2: String = textFromURL(url: url2) else {
            print("Received nothing from URL \"\(url2)\".");
            return nil;
            
        }
        
        guard let document2: Document = try? SwiftSoup.parse(webPage2) else {
            print("Could not parse webPage2.");
            return nil;
        }
        self.document2 = document2;
        
        guard let url3: URL = URL(string: address3) else {
            print("Could not create URL from address \"\(address3)\".");
            return nil;
        }
        
        guard let webPage3: String = textFromURL(url: url3) else {
            print("Received nothing from URL \"\(url3)\".");
            return nil;
            
        }
        
        guard let document3: Document = try? SwiftSoup.parse(webPage3) else {
            print("Could not parse webPage3.");
            return nil;
        }
        self.document3 = document3;
        
        guard let url4: URL = URL(string: address4) else {
            print("Could not create URL from address \"\(address4)\".");
            return nil;
        }
        
        guard let webPage4: String = textFromURL(url: url4) else {
            print("Received nothing from URL \"\(url4)\".");
            return nil;
            
        }
        
        guard let document4: Document = try? SwiftSoup.parse(webPage4) else {
            print("Could not parse webPage4.");
            return nil;
        }
        self.document4 = document4;
        
    }

    func getPrice() -> Double? {
        guard let priceelements: Elements = try?
            document1.getElementsByAttributeValueContaining("class", "Fz(36px)") else {
            print("Could not find element whose class contains \"Fz(36px)\".");
            return nil;
        }

        guard priceelements.count == 1 else {
            print("priceelements.count == \(priceelements.count)");
            return nil;
        }

        guard let text: String = try? priceelements[0].text() else {
            print("The price element had no text.");
            return nil;
        }

        let s: String = text.replacingOccurrences(of: ",", with: "");

        guard let price: Double = Double(s) else {
            print("The text \"\(text)\" is not a Double.");
            return nil;
        }

        return price;
    }
    
    func getName() -> String? {
        
        guard let nameelements: Elements = try? document1.getElementsByAttributeValueContaining("class", "D(ib) Fz(18px)") else {
            print("Could not find element whose class contains \"D(ib) Fz(18px)\"");
            return nil;
        }
        
        guard nameelements.count == 1 else {
            print("nameelements.count == \(nameelements.count)");
            return nil;
        }
        
        guard let nameText = try? nameelements[0].text() else {
            print("The name element had no text.");
            return nil;
        }
        
        return nameText
    }
    
    func getMarketCap() -> String? {
        
        guard let marketcapelements: Elements = try? document1.getElementsByAttributeValueContaining("data-reactid", "139") else {
            print("Could not find element whose class contains \"139\"");
            return nil;
        }

        guard marketcapelements.count == 1 else {
            print("marketcapelements.count == \(marketcapelements.count)");
            return nil;
        }

        guard let marketCapText = try? marketcapelements[0].text() else {
            print("The Market Cap element had no text.");
            return nil;
        }
        
        return marketCapText
        
    }
    
    
    func getPERatio() -> String? {
        
        guard let peratioelements: Elements = try? document1.getElementsByAttributeValueContaining("data-reactid", "149") else {
            print("Could not find element whose class contains \"149\"");
            return nil;
        }
        
        guard peratioelements.count == 1 else {
            print("peratioelements.count == \(peratioelements.count)");
            return nil;
        }
        
        guard let peRatioText = try? peratioelements[0].text() else {
            print("The PE Ratio element had no text.");
            return nil;
        }
        
        return peRatioText
    }
    
    func getEPS() -> String? {
        
        guard let epselements: Elements = try? document1.getElementsByAttributeValueContaining("data-reactid", "154") else {
            print("Could not find element whose class contains \"154\"");
            return nil;
        }
        
        guard epselements.count == 1 else {
            print("epselements.count == \(epselements.count)");
            return nil;
        }
        
        guard let epsText = try? epselements[0].text() else {
            print("The EPS element had no text.");
            return nil;
        }
        
        return epsText
    }
    
    func getAssets() -> String? {
        
        guard let assetsElements: Elements = try? document2.getElementsByAttributeValueMatching("data-reactid", "^76$") else {
            print("Could not find element whose class matches \"76\"");
            return nil;
        }
        
        guard assetsElements.count == 1 else {
            print("assetsElements.count == \(assetsElements.count)");
            return nil;
        }
        
        guard let assetsText = try? assetsElements[0].text() else {
            print("The assets element had no text.");
            return nil;
        }
        
        return assetsText
    }
    
    func getCashFlow() -> String? {
        
        guard let cashFlowElements: Elements = try? document3.getElementsByAttributeValueMatching("data-reactid", "^79$") else {
            print("Could not find element whose class contains \"259\"");
            return nil;
        }
        
        guard cashFlowElements.count == 1 else {
            print("descriptionelements.count == \(cashFlowElements.count)");
            return nil;
        }
        
        guard let cashFlowText = try? cashFlowElements[0].text() else {
            print("The description element had no text.");
            return nil;
        }
        
        return cashFlowText
    }
    
    func getDescription() -> String? {
        
        guard let descriptionElements: Elements = try? document4.getElementsByAttributeValueContaining("data-reactid", "137") else {
            print("Could not find element whose class contains \"137\"");
            return nil;
        }
        
        guard descriptionElements.count == 1 else {
            print("descriptionelements.count == \(descriptionElements.count)");
            return nil;
        }
        
        guard let descriptionText = try? descriptionElements[0].text() else {
            print("The description element had no text.");
            return nil;
        }
        
        return descriptionText
    }

    
}

