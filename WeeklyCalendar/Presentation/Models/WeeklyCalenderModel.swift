//
//  WeeklyCalenderModel.swift
//  WeeklyCalendar
//
//  Created by Hiroaki-Hirabayashi on 2022/04/01.
//

import Foundation

struct WeeklyCalenderModel {
    let date: Date

    func sectionString() -> String {
        let hour = DateUtils.getHourNumber(date)
        return "\(hour):00〜"
    }
}
