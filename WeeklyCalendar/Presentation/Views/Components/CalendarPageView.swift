//
//  CalendarPageView.swift
//  WeeklyCalendar
//
//  Created by Hiroaki-Hirabayashi on 2022/03/31.
//

import Parchment
import SwiftUI
import UIKit

struct CalendarPageView<Page: View>: View {
    private let options: PagingOptions
    private let content: (CalendarItem) -> Page

    init(
        options: PagingOptions = PagingOptions(),
        content: @escaping (CalendarItem) -> Page
    ) {
        self.options = options
        self.content = content
    }

    var body: some View {
        PagingController(
            options: options,
            content: content
        )
    }

    struct PagingController: UIViewControllerRepresentable {
        let options: PagingOptions
        let content: (CalendarItem) -> Page

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        func makeUIViewController(
            context: UIViewControllerRepresentableContext<PagingController>
        ) -> PagingViewController {
            let pagingViewController = PagingViewController()

            pagingViewController.register(CalendarPagingCell.self, for: CalendarItem.self)
            pagingViewController.menuItemSize = .fixed(width: 48, height: 58)
            pagingViewController.textColor = UIColor.gray

            // Set the current date as the selected paging item
            pagingViewController.select(pagingItem: CalendarItem(date: Date()))

            return pagingViewController
        }

        func updateUIViewController(
            _ pagingViewController: PagingViewController,
            context: UIViewControllerRepresentableContext<PagingController>
        ) {
            context.coordinator.parent = self
            if pagingViewController.infiniteDataSource == nil {
                pagingViewController.infiniteDataSource = context.coordinator
            } else {
                pagingViewController.reloadData(around: CalendarItem(date: Date()))
            }
        }
    }

    class Coordinator: PagingViewControllerInfiniteDataSource {
        var parent: PagingController

        init(_ pagingController: PagingController) {
            self.parent = pagingController
        }

        /// 何日表示するか
        func pagingViewController(
            _: PagingViewController,
            itemAfter pagingItem: PagingItem
        ) -> PagingItem? {
            if let calendarItem = pagingItem as? CalendarItem,
                let diff = DateUtils.getDayDiff(calendarItem.date),
                diff < 30 {
                return CalendarItem(date: DateUtils.addingDay(calendarItem.date, day: 1))
            }
            return nil
        }

        func pagingViewController(
            _: PagingViewController,
            itemBefore pagingItem: PagingItem
        ) -> PagingItem? {
            if let calendarItem = pagingItem as? CalendarItem,
                let diff = DateUtils.getDayDiff(calendarItem.date),
                diff > 0 {
                return CalendarItem(date: DateUtils.addingDay(calendarItem.date, day: -1))
            }
            return nil
        }

        func pagingViewController(
            _: PagingViewController,
            viewControllerFor pagingItem: PagingItem
        ) -> UIViewController {
            if let calendarItem = pagingItem as? CalendarItem {
                return UIHostingController(rootView: self.parent.content(calendarItem))
            }
            return UIHostingController(rootView: self.parent.content(CalendarItem(date: Date())))
        }
    }
}
