//
//  Styler.swift
//  rappmovie
//
//  Created by Restorando on 12/6/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

extension UIFont {

    class func appRegularFontWith(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }

    class func appBoldFontWith(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .bold)
    }

    class func appSemiBoldFontWith(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .semibold)
    }

    class func appLightFontWith(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .light)
    }
}

struct Styler {

    struct Color {
        static let darkGray = UIColor(red: 60/255.0, green: 60/255.0, blue: 60/255.0, alpha: 1.0)
        static let gray = UIColor.darkGray
        static let lightGray = UIColor(red: 238/255.0, green: 238/255.0, blue: 238/255.0, alpha: 1.0)
        static let darkWhite = UIColor(red: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1.0)
        static let lightWhite = UIColor(red: 250/255.0, green: 250/255.0, blue: 250/255.0, alpha: 1.0)
    }
}
