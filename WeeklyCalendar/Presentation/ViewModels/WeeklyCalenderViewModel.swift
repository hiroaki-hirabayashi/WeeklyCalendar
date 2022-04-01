//
//  WeeklyCalenderViewModel.swift
//  WeeklyCalendar
//
//  Created by Hiroaki-Hirabayashi on 2022/03/31.
//

import Foundation

struct TimeTablePageModel {
    let date: Date
    let sections: [WeeklyCalenderModel]
}

final class WeeklyCalenderViewModel: ObservableObject {
    @Published var models: [TimeTablePageModel]

    init() {
        models = WeeklyCalenderViewModel.createTestData()
    }

    func getSections(_ date: Date) -> [WeeklyCalenderModel] {
        if let result = self.models.first(where: { item in
            DateUtils.getDayDiff(item.date, date) == 0
        }) {
            return result.sections
        }
        return []
    }

    // swiftlint:disable superfluous_disable_command function_body_length line_length
    static func createTestData() -> [TimeTablePageModel] {
        let now = Date()
        let cal = Calendar(identifier: .gregorian)
        let nowYear = cal.component(.year, from: now)
        let nowMonth = cal.component(.month, from: now)
        let nowDay = cal.component(.day, from: now)
        let data1 = cal.date(
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
        )
        let lesson1 = data1!.addingTimeInterval(60 * 60 * 9)
        let lesson2 = data1!.addingTimeInterval(60 * 60 * 10)
        let lesson3 = data1!.addingTimeInterval((60 * 60 * 10) + 15)
        let lesson4 = data1!.addingTimeInterval((60 * 60 * 10) + 30)
        return []
    }
}


