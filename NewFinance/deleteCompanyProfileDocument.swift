//
//  CompanyProfileDocument.swift
//  NewFinance
//
//  Created by Mario Perozo on 6/12/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//


import Foundation;
import SwiftSoup;

struct CompanyProfileDocument {
    let document: Document;

    init?(descriptionWebPage: String) {   //failable initializer
        guard let document: Document = try? SwiftSoup.parse(descriptionWebPage) else {
            print("Could not parse descriptionWebPage.");
            return nil;
        }
        self.document = document;
    }

    
    
    func getDescription() -> String? {
        
        guard let descriptionElements: Elements = try? document.getElementsByAttributeValueContaining("data-reactid", "137") else {
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
