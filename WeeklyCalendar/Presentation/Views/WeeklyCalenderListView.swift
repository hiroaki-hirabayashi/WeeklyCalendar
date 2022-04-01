//
//  WeeklyCalenderListView.swift
//  WeeklyCalendar
//
//  Created by Hiroaki-Hirabayashi on 2022/03/31.
//

import SwiftUI

struct WeeklyCalenderListView: View {
    var sections: [WeeklyCalenderModel]
    var body: some View {
        if !sections.isEmpty {
            List {
                ForEach(0..<sections.count) { index in
                    let section = sections[index]
                    Section(
                        header:
                            Text(section.sectionString())
                            .padding(4)
                            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                            .background(.white)
                    ) {
                    }
                    .listRowInsets(
                        EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                    )
                }
            }
        } else {
            VStack {
                HStack { Spacer() }
                Spacer()
                Text("予定はありません")
                    .font(Font.system(size: 19))
                    .foregroundColor(Color.black)
                Spacer()
            }
            .background(.white)
        }
    }
}
