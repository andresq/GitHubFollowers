//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Andres Quintero on 9/21/20.
//  Copyright © 2020 Andres Quintero. All rights reserved.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
