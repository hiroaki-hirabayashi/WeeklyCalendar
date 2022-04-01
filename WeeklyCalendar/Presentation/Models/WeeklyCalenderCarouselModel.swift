////
////  WeeklyCalenderModel.swift
////  WeeklyCalendar
////
////  Created by Hiroaki-Hirabayashi on 2022/03/31.
////
//import Foundation
//
//struct WeeklyCalenderCarouselModel: Identifiable {
//    let id: String
//    let lessonName: String
//    let lessonImageUrl: String
//    var isReserved: Bool
//    let lessonStartTime: Date
//    let lessonEndTime: Date
//    let lessonTime: TimeInterval
//    let lessonIntensity: Int
//    let instractorName: String
//    let instractorImageUrl: String
//
//    func getDateString() -> String {
//        return DateUtils.dateString(lessonStartTime) +
//            DateUtils.timeIntervalString(lessonStartTime, lessonEndTime)
//    }
//
//    func getLessonTimeString() -> String {
//        let interval = Int(lessonTime / 60)
//        return "\(interval)分"
//    }
//
//    func getIntensityString() -> String {
//        switch lessonIntensity {
//        case 1: return "弱"
//        case 2: return "中"
//        case 3: return "強"
//        default: return "弱"
//        }
//    }
//}
