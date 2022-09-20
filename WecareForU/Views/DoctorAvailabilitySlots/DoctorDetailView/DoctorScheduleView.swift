//
//  DoctorScheduleView.swift
//  WecareForU
//
//  Created by apple on 5/5/22.
//

import SwiftUI

struct DoctorScheduleView: View {
    @State var schedules: [Schedule]
    var isSelectedValue: (_ schedule: Schedule) -> ()

    //MARK: TODO - map with original server value
    @State var schedulesCopy = [Schedule]()

    let columnGridItem = [GridItem(.flexible(minimum: 40), spacing: 10),
                          GridItem(.flexible(minimum: 40), spacing: 10)]
    
    init(schedules: [Schedule], isSelectedValue: @escaping (_ schedule: Schedule) -> ()) {
        self.schedules = schedules
        self.schedulesCopy = schedules
        self.isSelectedValue = isSelectedValue
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Schedules")
                .font(Font.fontWith(.semiBold, size: .medium))
            LazyVGrid(columns: columnGridItem, alignment: .leading, spacing: 0) {
                ForEach(schedules.indices) { index in
                    Button(schedules[index].time!) {
                        mapSchedulesArrayOnSelection(index)
                        isSelectedValue(schedules[index])
                        debugPrint(isSelectedValue)
                    }
                    .buttonStyle(AppButtonStyle(isOultined: !self.schedules[index].isAvailable!, paddingValue: 5))
                    .font(Font.fontWith(.semiBold, size: .small2))
                }
            }
        }
    }
    
    fileprivate func mapSchedulesArrayOnSelection(_ index: Int) {
        for i in 0..<self.schedules.count {
            self.schedules[i].isAvailable =  false
        }
        self.schedules[index].isAvailable = !self.schedules[index].isAvailable!
    }
    
}

struct DoctorScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorScheduleView(schedules: [Schedule.example], isSelectedValue: { value in
            
        })
    }
}
