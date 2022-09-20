//
//  BookingsCellView.swift
//  WecareForU
//
//  Created by apple on 5/11/22.
//

import SwiftUI

struct BookingsCellView: View {
    let data: Info
    var date: Date
    
    var title: String {
        return date.format("d")
    }
    
    var subtitle: String {
        return date.format("MMM").uppercased()
    }
    
    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .center) {
                Spacer()
                Text(title)
                    .foregroundColor(.white)
                    .font(Font.fontWith(.semiBold, size: .large))
                Spacer()
                    .frame(height: 10)
                Text(subtitle)
                    .foregroundColor(.white)
                    .font(Font.fontWith(.regular, size: .small))
                Spacer()
               
            }
            .frame(width: 54,height: 81)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.appPrimary)
                    .shadow(color: Color.white, radius: 2, x: 2, y: 2)
                    .shadow(color: Color.white, radius: 2, x: -2, y: -2)
            )
            
            VStack(alignment: .leading) {
                DoctorPersonalInfoView(data: data)
                DoctorAvailableTimeView(time: "Time: \(data.schedules?[0].time ?? "")" , spacerWidth: 4, fontSize: .small2)
            }
            
            Image("doctorImage2")
                .frame(width: 80, height: 70)
                .clipShape(Circle())
                .padding(.top, 0)
            
           
        }
        .padding(10)
        .frame(height: 125)
        .background(
         RoundedRectangle(cornerRadius: 15)
            .foregroundColor(.white)
            .shadow(color: Color.themeBlueColor, radius: 1, x: 0, y: 0)
            .shadow(color: Color.white, radius: 2, x: -2, y: -2)
        )
       
    }
}

struct BookingsCellView_Previews: PreviewProvider {
    static var previews: some View {
        BookingsCellView(data: Info.example, date: Date())
    }
}
