//
//  BalanceSheetDocument.swift
//  NewFinance
//
//  Created by Mario Perozo on 6/12/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import Foundation;
import SwiftSoup;

struct BalanceSheetDocument {
    let document: Document;

    init?(balanceSheetWebPage: String) {   //failable initializer
        guard let document: Document = try? SwiftSoup.parse(balanceSheetWebPage) else {
            print("Could not parse balanceSheetWebPage.");
            return nil;
        }
        self.document = document;
    }

    
    
    func getAssets() -> String? {
        
        guard let assetsElements: Elements = try? document.getElementsByAttributeValueContaining("data-reactid", "76") else {
            print("Could not find element whose class contains \"76\"");
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
    
    
}

