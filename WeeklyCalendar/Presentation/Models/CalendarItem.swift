//
//  CalendarItem.swift
//  WeeklyCalendar
//
//  Created by Hiroaki-Hirabayashi on 2022/03/31.
//

import Parchment

struct CalendarItem: PagingItem, Hashable, Comparable {
    let date: Date
    let dateText: String
    let weekdayText: String

    init(date: Date) {
        self.date = date
        dateText = DateUtils.dateFormatter.string(from: date)
        weekdayText = DateUtils.weekdayFormatter.string(from: date)
    }

    static func < (lhs: CalendarItem, rhs: CalendarItem) -> Bool {
        return lhs.date < rhs.date
    }
}
