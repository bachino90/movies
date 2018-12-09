//
//  Styler.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/6/18.
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
        static let darkBlack = UIColor(red: 10/255.0, green: 10/255.0, blue: 10/255.0, alpha: 1.0)
        static let black = UIColor(red: 20/255.0, green: 20/255.0, blue: 20/255.0, alpha: 1.0)
        static let lightBlack = UIColor(red: 35/255.0, green: 35/255.0, blue: 35/255.0, alpha: 1.0)
        static let darkGray = UIColor(red: 50/255.0, green: 50/255.0, blue: 50/255.0, alpha: 1.0)
        static let gray = UIColor.darkGray
        static let lightGray = UIColor(red: 238/255.0, green: 238/255.0, blue: 238/255.0, alpha: 1.0)
        static let darkWhite = UIColor(red: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1.0)
        static let lightWhite = UIColor(red: 250/255.0, green: 250/255.0, blue: 250/255.0, alpha: 1.0)
        static let red = UIColor.red
    }
}
