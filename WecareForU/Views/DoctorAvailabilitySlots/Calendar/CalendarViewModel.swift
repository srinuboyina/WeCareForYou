//
//  CalendarViewModel.swift
//  WecareForU
//
//  Created by apple on 5/6/22.
//

import Foundation

class CalendarViewModel: ObservableObject {
    
    @Published private(set) var array = [ Date() ]
    
    let batchSize: Int = 10
    
    func loadMoreDatesIfNeeded(for date: Date? = nil) {
        guard array.count > batchSize else {
            loadMoreDates()
            return
        }
        guard let date = date else {
            loadMoreDates()
            return
        }
        if array[batchSize-1] == date {
            loadMoreDates()
        }
    }
    
    func loadMoreDates() {
        let startDate = array.first ?? Date()
        for i in 1...batchSize {
            if let date = Calendar.current.date(byAdding: .day, value: -i, to: startDate) {
                array.insert(date, at: 0)
            }
        }
    }
}
