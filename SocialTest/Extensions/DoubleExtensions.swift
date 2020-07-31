//
//  DoubleExtensions.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/31/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    func money(discountPercent: Int = 0) -> String {
        let result = self * ((100 - Double(discountPercent)) / 100)
        return String(format: "%.2f", result) + " \(Constants.moneyCurrency)"
        
    }
    
    func discountedMoney() -> NSMutableAttributedString {
        let string = String(format: "%.2f", self) + " \(Constants.moneyCurrency)"
        
        let attributes = [NSAttributedString.Key.foregroundColor : UIColor(named: "ccRed")!,
                          NSAttributedString.Key.font : UIFont(name: "Poppins-SemiBold", size: 10)!,
                          NSAttributedString.Key.strikethroughStyle : 1] as [NSAttributedString.Key : Any]

        let attributedString = NSMutableAttributedString(string: string, attributes: attributes)
        
        return attributedString
    }
}
