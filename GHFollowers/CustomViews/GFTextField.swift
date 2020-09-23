//
//  GFTextField.swift
//  GHFollowers
//
//  Created by Andres Quintero on 8/24/20.
//  Copyright © 2020 Andres Quintero. All rights reserved.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        
        // We want the input to shrink to see the whole input on the line
        adjustsFontSizeToFitWidth = true
        // however, we want it to stop at size 12
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        
        placeholder = "Enter a username"
    }
}
