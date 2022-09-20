//
//  DoctorAvailableTimeView.swift
//  WecareForU
//
//  Created by apple on 5/5/22.
//

import SwiftUI

struct DoctorAvailableTimeView: View {
    let time: String
    let spacerWidth: CGFloat
    let fontSize: Font.FontSize
    var body: some View {
        HStack {
            Image("timer")
                .resizable()
                .frame(width: 14, height: 14)
            Spacer().frame(width: spacerWidth)
            Text(time)
                .foregroundColor(.appSecondary)
                .font(Font.fontWith(.regular, size: fontSize))
            Spacer()
        }
    }
}


struct DoctorAvailableTimeView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorAvailableTimeView(time: Info.example.availabilityTime ?? "", spacerWidth: 10, fontSize: .small)
    }
}
