//
//  GFEmptyStateView.swift
//  GHFollowers
//
//  Created by Andres Quintero on 9/7/20.
//  Copyright © 2020 Andres Quintero. All rights reserved.
//

import UIKit

class GFEmptyStateView: UIView {
    
    let messsageLabel = GFTitleLabel(textAligment: .center, fontSize: 28)
    let logoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message: String) {
        super.init(frame: .zero)
        messsageLabel.text = message
        configure()
    }
    
    
    private func configure() {
        addSubview(messsageLabel)
        addSubview(logoImageView)
        
        messsageLabel.numberOfLines = 3
        messsageLabel.textColor = .secondaryLabel
        
        logoImageView.image = UIImage(named: "empty-state-logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messsageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            messsageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messsageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messsageLabel.heightAnchor.constraint(equalToConstant: 200),
            
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
            logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40)
        ])
    }

}
