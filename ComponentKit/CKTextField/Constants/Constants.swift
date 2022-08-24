//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit

public enum Images {
    case ic_apple
    case ic_eyeSlash
    case ic_google
    case RegistrationPageImage
    case workspaceBackground

    public var images: UIImage? {
        switch self {
        case .ic_apple: return UIImage(named: "ic_apple")
        case .ic_eyeSlash: return UIImage(named: "ic_eyeSlash")
        case .ic_google: return UIImage(named: "ic_google")
        case .RegistrationPageImage: return UIImage(named: "RegistrationPageImage")
        case .workspaceBackground: return UIImage(named: "workspaceBackground")
        }
    }
}

public enum Colors {
    case baseBackgroundDark
    case basePurple
    case baseTextFieldDarkGray
    case baseTextWhiteColor

    var colors: UIColor? {
        switch self {
        case .baseBackgroundDark: return UIColor(named: "baseBackgroundDark")
        case .basePurple: return UIColor(named: "basePurple")
        case .baseTextFieldDarkGray: return UIColor(named: "baseTextFieldDarkGray")
        case .baseTextWhiteColor: return .white
        }
    }
}

enum Icons {
    case user
    case filterParametr
    case xMark
    case plus
    case shapes
    case camera
    case crop
    case eyeSlash
    case trashBin
    case share
    case settings
    case back
    case filters
    case backArrow
    case forwardArrow
    case forward
    case squarStack
    case text
    case menuGrid

    var icons: UIImage? {
        switch self {
        case .user: return UIImage(systemName: "person")
        case .filterParametr: return UIImage(systemName: "slider.horizontal.3")
        case .xMark: return UIImage(systemName: "xmark")
        case .plus: return UIImage(systemName: "plus.circle")
        case .shapes: return UIImage(systemName: "square.on.circle")
        case .camera: return UIImage(systemName: "camera")
        case .crop: return UIImage(systemName: "crop")
        case .eyeSlash: return UIImage(systemName: "eye.slash")
        case .trashBin: return UIImage(systemName: "trash")
        case .share: return UIImage(systemName: "square.and.arrow.up")
        case .settings: return UIImage(systemName: "gearshape")
        case .back: return UIImage(systemName: "chevron.backward")
        case .filters: return UIImage(systemName: "camera.filters")
        case .backArrow: return UIImage(systemName: "arrow.uturn.backward")
        case .forwardArrow: return UIImage(systemName: "arrow.uturn.forward")
        case .forward: return UIImage(systemName: "chevron.forward")
        case .squarStack: return UIImage(systemName: "square.stack.3d.up")
        case .text: return UIImage(systemName: "textformat")
        case .menuGrid: return UIImage(systemName: "square.grid.2x2")
        }
    }
}

// fonts
extension UIFont {
    // YOU can use like that: someLabel.font = .montserratBold(size: 40)
    static func montserratLight(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-Light", size: size)
    }

    static func montserratRegular(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-Regular", size: size)
    }

    static func montserratThin(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-Thin", size: size)
    }

    static func montserratMedium(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-Medium", size: size)
    }

    static func montserratBold(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-Bold", size: size)
    }

    static func montserratSemiBold(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-SemiBold", size: size)
    }

    static func montserratExtraBold(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-ExtraBold", size: size)
    }

    static func montserratBlack(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-Black", size: size)
    }
}
