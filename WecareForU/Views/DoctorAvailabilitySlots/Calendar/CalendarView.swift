//
//  CalendarView.swift
//  WecareForU
//
//  Created by apple on 5/6/22.
//

import SwiftUI

struct CalendarView: View {
    @StateObject var vm = CalendarViewModel()
    @State private var selectedDate = Date()
    var body: some View {
     ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(vm.array, id: \.self) { date in
                    CalendarCell(date: date)
                        .onAppear {
                            vm.loadMoreDates()
                        }
                        .onTapGesture {
                            selectedDate = date
                        }
                }
            }
        }
        .frame(height: 100)
        .padding(20)
    }
    
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
