//
//  AuthSignUpHeaderView.swift
//  StretchyHeader
//
//  Created by Alvin John Tandoc on 11/1/20.
//  Copyright © 2020 Alvin John Tandoc. All rights reserved.
//

import UIKit

class SignUpHeaderView: UIView {
    var stickyHeightConstraint : NSLayoutConstraint?
    
    var defaultHeight: CGFloat {
        return 280.0
    }
    
    var minimumHeight: CGFloat {
        return 180.0
    }
}

extension SignUpHeaderView: ATIdentifiable, HeaderViewStretchable {}
