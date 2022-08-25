//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit

public enum Colors {
    case base_background_dark
    case base_purple
    case base_text_field_dark_gray
    case base_text_white_color

    public var color: UIColor? {
        switch self {
        case .base_background_dark: return UIColor(named: "baseBackgroundDark")
        case .base_purple: return UIColor(named: "basePurple")
        case .base_text_field_dark_gray: return UIColor(named: "baseTextFieldDarkGray")
        case .base_text_white_color: return .white
        }
    }
}
