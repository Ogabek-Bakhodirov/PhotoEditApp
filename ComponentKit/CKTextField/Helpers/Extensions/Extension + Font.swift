//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit

extension UIFont {
    // YOU can use like that: someLabel.font = .montserratBold(size: 40)
    public static func montserratLight(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-Light", size: size)
    }

    public static func montserratRegular(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-Regular", size: size)
    }

    public static func montserratThin(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-Thin", size: size)
    }

    public static func montserratMedium(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-Medium", size: size)
    }

    public static func montserratBold(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-Bold", size: size)
    }

    public static func montserratSemiBold(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-SemiBold", size: size)
    }

    public static func montserratExtraBold(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-ExtraBold", size: size)
    }

    public static func montserratBlack(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-Black", size: size)
    }
}
