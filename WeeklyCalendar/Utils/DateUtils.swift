//
//  DateUtils.swift
//  WeeklyCalendar
//
//  Created by Hiroaki-Hirabayashi on 2022/03/31.
//

import CalculateCalendarLogic
import Foundation

final class DateUtils {
    static func isHoliday(_ date: Date) -> Bool {
        let tmpCalendar = Calendar(identifier: .gregorian)
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        let holiday = CalculateCalendarLogic()
        return holiday.judgeJapaneseHoliday(year: year, month: month, day: day)
    }

    static func getHourNumber(_ date: Date) -> Int {
        let tmpCalendar = Calendar(identifier: .gregorian)
        return tmpCalendar.component(.hour, from: date)
    }

    static func getWeekIndex(_ date: Date) -> Int {
        let tmpCalendar = Calendar(identifier: .gregorian)
        return tmpCalendar.component(.weekday, from: date)
    }

    static func addingDay(_ date: Date, day: TimeInterval) -> Date {
        return date.addingTimeInterval((60 * 60 * 24) * day)
    }

    static func getDayDiff(_ date: Date, _ target: Date = Date()) -> Int? {
        let tmpCalendar = Calendar(identifier: .gregorian)
        let currentYear = tmpCalendar.component(.year, from: date)
        let currentMonth = tmpCalendar.component(.month, from: date)
        let currentDay = tmpCalendar.component(.day, from: date)
        let nowDate = target
        let nowYear = tmpCalendar.component(.year, from: nowDate)
        let nowMonth = tmpCalendar.component(.month, from: nowDate)
        let nowDay = tmpCalendar.component(.day, from: nowDate)

        if let current = tmpCalendar.date(
            from: DateComponents(
                era: 1,
                year: currentYear,
                month: currentMonth,
                day: currentDay,
                hour: 0,
                minute: 0,
                second: 0,
                nanosecond: 0
            )
        ), let now = tmpCalendar.date(
            from: DateComponents(
                era: 1,
                year: nowYear,
                month: nowMonth,
                day: nowDay,
                hour: 0,
                minute: 0,
                second: 0,
                nanosecond: 0
            )
        ) {
            return Int(current.timeIntervalSince1970 - now.timeIntervalSince1970) / 24 / 60 / 60
        }
        return nil
    }

    static func timeIntervalString(
        _ start: Date,
        _ end: Date?,
        format: String = "HH:mm",
        demilitar: String = "〜"
    ) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        if let end = end {
            return formatter.string(from: start) + demilitar + formatter.string(from: end)
        } else {
            return formatter.string(from: start) + demilitar
        }
    }

    static func dateString(
        _ date: Date,
        format: String = "MM/dd(EEE)"
    ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }

    static var shortDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .short
        return dateFormatter
    }()

    static var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter
    }()

    static var weekdayFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = "EEE"
        return dateFormatter
    }()
}
