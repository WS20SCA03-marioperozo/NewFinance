//
//  FinancialDocument.swift
//  NewFinance
//
//  Created by Mario Perozo on 6/11/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import Foundation;
import SwiftSoup;

struct IncomeStatementDocument {
    let document: Document;

    init?(webPage: String) {   //failable initializer
        guard let document: Document = try? SwiftSoup.parse(webPage) else {
            print("Could not parse webPage.");
            return nil;
        }
        self.document = document;
    }

    func getPrice() -> Double? {
        guard let priceelements: Elements = try? document.getElementsByAttributeValueContaining("class", "Fz(36px)") else {
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
        
        guard let nameelements: Elements = try? document.getElementsByAttributeValueContaining("class", "D(ib) Fz(18px)") else {
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
        
        guard let marketcapelements: Elements = try? document.getElementsByAttributeValueContaining("data-reactid", "139") else {
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
        
        guard let peratioelements: Elements = try? document.getElementsByAttributeValueContaining("data-reactid", "149") else {
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
        
        guard let epselements: Elements = try? document.getElementsByAttributeValueContaining("data-reactid", "154") else {
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

    
}

