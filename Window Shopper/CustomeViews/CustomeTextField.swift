//
//  CustomeTextField.swift
//  Window Shopper
//
//  Created by Madian on 2/12/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import UIKit

@IBDesignable
class CustomeTextField: UITextField {

    override func draw(_ rect: CGRect) {
        setUpSymbolLabel()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    override func prepareForInterfaceBuilder() {
        setUp()
    }

    func setUp() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.25)
        layer.cornerRadius = 5.0
        textAlignment = .center
        clipsToBounds = true
        
        if let placeholder = placeholder{
            let placAttributedString = NSAttributedString(string: placeholder, attributes: [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
            attributedPlaceholder = placAttributedString
            textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    func setUpSymbolLabel() {
        let size: CGFloat = 30
        let currencyLabel = UILabel(frame: CGRect(x: 5, y: (frame.size.height / 2) - size / 2, width: size, height: size))
        currencyLabel.backgroundColor = #colorLiteral(red: 0.8814564443, green: 0.8814564443, blue: 0.8814564443, alpha: 0.8)
        currencyLabel.textAlignment = .center
        currencyLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        currencyLabel.layer.cornerRadius = 5.0
        currencyLabel.clipsToBounds = true
        currencyLabel.adjustsFontSizeToFitWidth = true
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        
        currencyLabel.text = formatter.currencySymbol
        
        addSubview(currencyLabel)
    }
}
