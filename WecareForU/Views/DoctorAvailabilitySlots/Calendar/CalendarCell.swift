//
//  CalendarCell.swift
//  WecareForU
//
//  Created by apple on 5/6/22.
//

import SwiftUI


struct CalendarCell: View {
    
    var date: Date
    
    var title: String {
        return date.format("d")
    }
    
    var subtitle: String {
        return date.format("MMM").uppercased()
    }
    
    var date1: String {
        return date.format("dd-MM-yy")
    }
    
    
    var date2: String {
        return Date().format("dd-MM-yy")
    }
    
    var isToday: Bool {
        return date1 == date2
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text(title)
                .foregroundColor(isToday ? .white : .appPrimary)
                .font(Font.fontWith(.semiBold, size: .large))
            Spacer()
                .frame(height: 10)
            Text(subtitle)
                .foregroundColor(isToday ? .white : .appPrimary)
                .font(Font.fontWith(.regular, size: .small))
            Spacer()
        }
        .frame(width: 54,height: 81)
        .background(
            RoundedRectangle(cornerRadius: 4).fill(changeGradientBasedOnTodaysDate())
                .shadow(color: Color.white, radius: 2, x: 2, y: 2)
                .shadow(color: Color.white, radius: 2, x: -2, y: -2)
        )
    }
    
    fileprivate func changeGradientBasedOnTodaysDate() -> LinearGradient {
        return isToday ? LinearGradient(gradient: Gradient(colors: [.themeBlueColor, .themeLightColor]), startPoint: .top, endPoint: .bottom) : LinearGradient(gradient: Gradient(colors: [.appBg, .appBg]), startPoint: .top, endPoint: .bottom)
    }
    
}

struct CalendarCell_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCell(date: Date())
    }
}
