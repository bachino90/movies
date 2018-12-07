//
//  DateUtils.swift
//  rappmovie
//
//  Created by Restorando on 12/6/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation

class DateUtils {

    static let sharedInstance = DateUtils()

    static let yearFormat = "yyyy"
    static let releaseDateFormat = "yyyy-MM-dd"

    private var allFormatters = [String : DateFormatter]()


    lazy var yearDateFormatter: DateFormatter = {
        return self.dateFormatterWithPattern(DateUtils.yearFormat)
    }()

    lazy var releaseDateFormatter: DateFormatter = {
        return self.dateFormatterWithPattern(DateUtils.releaseDateFormat)
    }()

    // MARK: - Private methods

    private func dateFormatterWithPattern(_ pattern: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = pattern
        allFormatters[pattern] = formatter
        return formatter
    }
}
