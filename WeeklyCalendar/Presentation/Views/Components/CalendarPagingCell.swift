//
//  CalendarPagingCell.swift
//  WeeklyCalendar
//
//  Created by Hiroaki-Hirabayashi on 2022/03/31.
//

import Parchment
import UIKit

class CalendarPagingCell: PagingCell {
    private var options: PagingOptions?

    lazy var dateLabel: UILabel = {
        let dateLabel = UILabel(frame: .zero)
        dateLabel.font = UIFont.systemFont(ofSize: 20)
        return dateLabel
    }()

    lazy var weekdayLabel: UILabel = {
        let weekdayLabel = UILabel(frame: .zero)
        weekdayLabel.font = UIFont.systemFont(ofSize: 12)
        return weekdayLabel
    }()

    lazy var date: Date = Date()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let insets = UIEdgeInsets(top: 10, left: 0, bottom: 5, right: 0)

        dateLabel.frame = CGRect(
            x: 0,
            y: insets.top,
            width: contentView.bounds.width,
            height: contentView.bounds.midY - insets.top
        )

        weekdayLabel.frame = CGRect(
            x: 0,
            y: contentView.bounds.midY,
            width: contentView.bounds.width,
            height: contentView.bounds.midY - insets.bottom
        )
    }

    fileprivate func configure() {
        weekdayLabel.backgroundColor = .white
        weekdayLabel.textAlignment = .center
        dateLabel.backgroundColor = .white
        dateLabel.textAlignment = .center

        addSubview(weekdayLabel)
        addSubview(dateLabel)
    }

    fileprivate func updateSelectedState(selected: Bool) {
        guard let options = options else { return }
        if selected {
            dateLabel.textColor = options.selectedTextColor
            weekdayLabel.textColor = options.selectedTextColor
        } else {
            if DateUtils.isHoliday(date) || DateUtils.getWeekIndex(date) == 1 {
                dateLabel.textColor = UIColor.red
                weekdayLabel.textColor = UIColor.red
            } else if DateUtils.getWeekIndex(date) == 7 {
                dateLabel.textColor = UIColor.blue
                weekdayLabel.textColor = UIColor.blue
            } else {
                dateLabel.textColor = options.textColor
                weekdayLabel.textColor = options.textColor
            }
        }
    }

    override func setPagingItem(_ pagingItem: PagingItem, selected: Bool, options: PagingOptions) {
        self.options = options
        if let calendarItem = pagingItem as? CalendarItem {
            date = calendarItem.date
            dateLabel.text = calendarItem.dateText
            weekdayLabel.text = calendarItem.weekdayText
            updateSelectedState(selected: selected)
        }
    }

    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
    }
}
