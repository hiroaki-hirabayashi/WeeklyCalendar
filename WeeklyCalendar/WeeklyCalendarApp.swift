//
//  WeeklyCalendarApp.swift
//  WeeklyCalendar
//
//  Created by Hiroaki-Hirabayashi on 2022/03/31.
//

import SwiftUI

@main
struct WeeklyCalendarApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            WeeklyCalenderView()
        }
    }
}
