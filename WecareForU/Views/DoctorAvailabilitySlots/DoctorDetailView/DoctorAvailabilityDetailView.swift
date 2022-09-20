//
//  DoctorAvailabilityDetailView.swift
//  WecareForU
//
//  Created by apple on 5/5/22.
//

import SwiftUI

struct DoctorAvailabilityDetailView: View {
    let time: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("Availability")
                .font(Font.fontWith(.semiBold, size: .medium))
            DoctorAvailableTimeView(time: time, spacerWidth: 23, fontSize: .medium)
        }
    }
}
struct DoctorAvailabilityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorAvailabilityDetailView(time: Info.example.availabilityTime ?? "")
    }
}
