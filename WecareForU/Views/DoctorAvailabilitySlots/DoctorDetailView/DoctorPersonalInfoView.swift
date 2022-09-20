//
//  DoctorPersonalInfoView.swift
//  WecareForU
//
//  Created by apple on 5/11/22.
//

import SwiftUI

struct DoctorPersonalInfoView: View {
    let data: Info
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(data.name ?? "")
                .font(Font.fontWith(.bold, size: .large))
                .padding(.top, 5)
            Text(data.specializedIn ?? "")
                .font(Font.fontWith(.semiBold, size: .medium))
                .foregroundColor(.appSecondary)
            Text(data.address ?? "")
                .font(Font.fontWith(.regular, size: .small2))
                .foregroundColor(.appSecondary)
        }
    }
}

struct DoctorPersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorPersonalInfoView(data: Info.example)
    }
}
