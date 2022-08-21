//
//  Constants.swift
//  PhotoEditApp
//
//  Created by Ogabek Bakhodirov on 21/08/22.
//

import Foundation
import UIKit

enum Images{
    
}

enum Colors{
    case baseBackgroundDark
    case basePurple
    case baseTextFieldDarkGray
    case baseTextWhiteColor
    
    var colors: UIColor?{
        switch self {
        case .baseBackgroundDark: return UIColor(named: "baseBackgroundDark")
        case .basePurple: return UIColor(named: "basePurple")
        case .baseTextFieldDarkGray: return UIColor(named: "baseTextFieldDarkGray")
        case .baseTextWhiteColor: return .white
        }
    }
}

enum Strings{
    
}
