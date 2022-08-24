//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit

public enum Colors {
    case baseBackgroundDark
    case basePurple
    case baseTextFieldDarkGray
    case baseTextWhiteColor

    public var colors: UIColor? {
        switch self {
        case .baseBackgroundDark: return UIColor(named: "baseBackgroundDark")
        case .basePurple: return UIColor(named: "basePurple")
        case .baseTextFieldDarkGray: return UIColor(named: "baseTextFieldDarkGray")
        case .baseTextWhiteColor: return .white
        }
    }
}
