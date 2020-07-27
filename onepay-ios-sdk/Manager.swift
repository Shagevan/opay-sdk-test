//
//  Manager.swift
//  MySdk
//
//  Created by ShagevanParameswaran on 24/7/20.
//  Copyright © 2020 ShagevanParameswaran. All rights reserved.
//

import UIKit


public class Manager{
    
    public init(){}
    
    public func viewController() -> UIViewController{
        let bundle = Bundle(for: PaymentPageViewController.self)
        let vc = PaymentPageViewController(nibName: "PaymentPageViewController", bundle: bundle)
        return vc
    }
}
