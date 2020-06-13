//
//  CashFlowStatementDocument.swift
//  NewFinance
//
//  Created by Mario Perozo on 6/12/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import Foundation;
import SwiftSoup;

struct CashFlowStatementDocument {
    let document: Document;

    init?(cashFlowWebPage: String) {   //failable initializer
        guard let document: Document = try? SwiftSoup.parse(cashFlowWebPage) else {
            print("Could not parse cashFlowWebPage.");
            return nil;
        }
        self.document = document;
    }

    
    
    func getCashFlow() -> String? {
        
        guard let cashFlowElements: Elements = try? document.getElementsByAttributeValueContaining("data-reactid", "272") else {
            print("Could not find element whose class contains \"272\"");
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
    
    
}
