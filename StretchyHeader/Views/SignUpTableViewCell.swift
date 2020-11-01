//
//  SignUpTableViewCell.swift
//  StretchyHeader
//
//  Created by Alvin John Tandoc on 11/1/20.
//  Copyright © 2020 Alvin John Tandoc. All rights reserved.
//

import UIKit

class SignUpTableViewCell: UITableViewCell {
    
    var item: SignUpItem?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var trailingButton: UIButton!
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 5;
            containerView.clipsToBounds = true
            containerView.layer.borderWidth = 1
            containerView.layer.borderColor = UIColor.lightGray.cgColor
            containerView.backgroundColor = UIColor.white
        }
    }
    
    func bind(_ item: SignUpItem) {
        textField.placeholder = item.placeholder
        self.item = item
    }
}

extension SignUpTableViewCell: ATIdentifiable {}

enum SignUpItem: String {
    case firstName
    case lastName
    case address
    case email
    case mobileNo
    case password
    case confirmPassword
    
    var key: String {
        switch self {
        case .firstName:
            return "first_name"
        case .lastName:
            return "last_name"
        case .address:
            return "address"
        case .email:
            return "email"
        case .mobileNo:
            return "mobile_number"
        case .password:
            return "password"
        case .confirmPassword:
            return "confirm_password"
        }
    }
    
    var placeholder: String {
       switch self {
        case .firstName:
            return "First Name"
        case .lastName:
            return "Last Name"
        case .address:
            return "Address"
        case .email:
            return "Email"
        case .mobileNo:
            return "Mobile Number"
        case .password:
            return "Password"
        case .confirmPassword:
            return "Confirm Password"
        }
    }
}
