//
//  UIView+Xib.swift
//  StretchyHeader
//
//  Created by Alvin John Tandoc on 11/1/20.
//  Copyright © 2020 Alvin John Tandoc. All rights reserved.
//

import Foundation

import Foundation
import UIKit

func instanceFromNib<T: UIView>() -> T  where T: ATIdentifiable {
    return UINib(nibName: T.identifier, bundle: nil)
        .instantiate(withOwner: nil, options: nil)[0] as! T
}
