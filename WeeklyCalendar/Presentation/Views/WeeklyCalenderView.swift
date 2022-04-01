//
//  WeeklyCalenderView.swift
//  WeeklyCalendar
//
//  Created by Hiroaki-Hirabayashi on 2022/03/31.
//
import SwiftUI

struct WeeklyCalenderView: View {
    @ObservedObject var viewModel = WeeklyCalenderViewModel()
    var body: some View {
        CalendarPageView { item in
            WeeklyCalenderListView(sections: viewModel.getSections(item.date))
        }
    }
}

