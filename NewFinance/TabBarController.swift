//
//  TabBarController.swift
//  NewFinance
//
//  Created by Mario Perozo on 6/13/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import UIKit;

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad();
        delegate = self;   //The TabBarController is its own delegate.
    }
    
    // MARK: - UITabBarControllerDelegate
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("About to go from \(type(of: selectedViewController!)) to \(type(of: viewController)).");
        
        if let source: FirstViewController = selectedViewController as? FirstViewController,
            let destination: SecondViewController = viewController as? SecondViewController {
            destination.financeDocument = source.financeDocument;   //Transmit information from one view controller to another.
        }
        
        if let source: FirstViewController = selectedViewController as? FirstViewController,
            let destination: ThirdViewController = viewController as? ThirdViewController {
            destination.financeDocument = source.financeDocument;   //Transmit information from one view controller to another.
        }
        
        if let source: FirstViewController = selectedViewController as? FirstViewController,
            let destination: FourthViewController = viewController as? FourthViewController {
            destination.financeDocument = source.financeDocument;   //Transmit information from one view controller to another.
        }
        
        if let source: FirstViewController = selectedViewController as? FirstViewController,
            let destination: FifthViewController = viewController as? FifthViewController {
            destination.financeDocument = source.financeDocument;   //Transmit information from one view controller to another.
        }
        
        if let source: SecondViewController = selectedViewController as? SecondViewController,
            let destination: FirstViewController = viewController as? FirstViewController {
            destination.financeDocument = source.financeDocument;   //Transmit information from one view controller to another.
        }
        
        if let source: SecondViewController = selectedViewController as? SecondViewController,
            let destination: ThirdViewController = viewController as? ThirdViewController {
            destination.financeDocument = source.financeDocument;   //Transmit information from one view controller to another.
        }
        
        if let source: SecondViewController = selectedViewController as? SecondViewController,
            let destination: FourthViewController = viewController as? FourthViewController {
            destination.financeDocument = source.financeDocument;   //Transmit information from one view controller to another.
        }
        
        if let source: SecondViewController = selectedViewController as? SecondViewController,
            let destination: FifthViewController = viewController as? FifthViewController {
            destination.financeDocument = source.financeDocument;   //Transmit information from one view controller to another.
        }
        
        if let source: ThirdViewController = selectedViewController as? ThirdViewController,
            let destination: FirstViewController = viewController as? FirstViewController {
            destination.financeDocument = source.financeDocument;   //Transmit information from one view controller to another.
        }
        
        if let source: ThirdViewController = selectedViewController as? ThirdViewController,
            let destination: SecondViewController = viewController as? SecondViewController {
            destination.financeDocument = source.financeDocument;   //Transmit information from one view controller to another.
        }
        
        if let source: ThirdViewController = selectedViewController as? ThirdViewController,
            let destination: FourthViewController = viewController as? FourthViewController {
            destination.financeDocument = source.financeDocument;   //Transmit information from one view controller to another.
        }
        
        if let source: ThirdViewController = selectedViewController as? ThirdViewController,
            let destination: FifthViewController = viewController as? FifthViewController {
            destination.financeDocument = source.financeDocument;   //Transmit information from one view controller to another.
        }
        
        if let source: FourthViewController = selectedViewController as? FourthViewController,
            let destination: FirstViewController = viewController as? FirstViewController {
            destination.financeDocument = source.financeDocument;   //Transmit information from one view controller to another.
        }
        
        if let source: FourthViewController = selectedViewController as? FourthViewController,
            let destination: SecondViewController = viewController as? SecondViewController {
            destination.financeDocument = source.financeDocument;   //Transmit information from one view controller to another.
        }
        
        if let source: FourthViewController = selectedViewController as? FourthViewController,
            let destination: ThirdViewController = viewController as? ThirdViewController {
            destination.financeDocument = source.financeDocument;   //Transmit information from one view controller to another.
        }
        
        if let source: FourthViewController = selectedViewController as? FourthViewController,
            let destination: FifthViewController = viewController as? FifthViewController {
            destination.financeDocument = source.financeDocument;   //Transmit information from one view controller to another.
        }
        
        if let source: FifthViewController = selectedViewController as? FifthViewController,
            let destination: SecondViewController = viewController as? SecondViewController {
            destination.financeDocument = source.financeDocument;   //Transmit information from one view controller to another.
        }
        
        if let source: FifthViewController = selectedViewController as? FifthViewController,
            let destination: ThirdViewController = viewController as? ThirdViewController {
            destination.financeDocument = source.financeDocument;   //Transmit information from one view controller to another.
        }
        
        if let source: FifthViewController = selectedViewController as? FifthViewController,
            let destination: FourthViewController = viewController as? FourthViewController {
            destination.financeDocument = source.financeDocument;   //Transmit information from one view controller to another.
        }
        
        if let source: FifthViewController = selectedViewController as? FifthViewController,
            let destination: FirstViewController = viewController as? FirstViewController {
            destination.financeDocument = source.financeDocument;   //Transmit information from one view controller to another.
        }
        
        return true;
        
        
    }
}
