//
//  LanguageSelectionCardView.swift
//  WecareForU
//
//  Created by apple on 5/4/22.
//

import SwiftUI

struct LanguageSelectionCardView: View {
    
    @Binding var isSelected: Bool
    var languageName: LocalizedStringKey
    
    var body: some View {
        ZStack {
            HStack(spacing: 30) {
                VStack {
                    Circle()
                        .stroke(isSelected ? .white :Color.appPrimary, lineWidth: 2)
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20)
                        .background(Circle().foregroundColor(Color.white))
                        .background(
                            Circle()
                                .stroke(isSelected ? .white : Color.appPrimary, lineWidth: 2)
                                .foregroundColor(.white)
                                .frame(width: isSelected ? 30: 0, height: isSelected ? 30: 0)
                        )
                    Spacer()
                    Text(languageName)
                        .font(Font.fontWith(.semiBold, size: .semiLarge))
                        .foregroundColor(isSelected ? .white : .appPrimary)
                        .padding(.bottom, 20)
                }
            }
            .frame(width: 100, height: 120)

        }
        .padding(20)
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(Color.appPrimary, lineWidth: 2)
        )
        .background(
            RoundedRectangle(cornerRadius: 22).fill(isSelected ?  LinearGradient(gradient: Gradient(colors: [.themeBlueColor, .themeLightColor]), startPoint: .top, endPoint: .bottom) : LinearGradient(gradient: Gradient(colors: [.white, .white]), startPoint: .top, endPoint: .bottom))
        )
//        .onTapGesture {
//            isSelected.toggle()
//        }
    }
    
}

struct LanguageSelectionCardView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSelectionCardView(isSelected: .constant(false), languageName: "english")
    }
}
