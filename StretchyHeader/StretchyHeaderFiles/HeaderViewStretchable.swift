//
//  HeaderViewStretchable.swift
//  StretchyHeader
//
//  Created by Alvin John Tandoc on 11/1/20.
//  Copyright © 2020 Alvin John Tandoc. All rights reserved.
//

import Foundation
import UIKit

protocol HeaderViewStretchable: UIView {
    /// Initial height of the header view
    var defaultHeight: CGFloat { get }
    
    /// Minimum height of the header view
    var minimumHeight: CGFloat { get }
    
    /// leave this as nil
    var stickyHeightConstraint : NSLayoutConstraint? { get set }
}

