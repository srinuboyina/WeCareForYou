//
//  DashboardCardView.swift
//  WecareForU
//
//  Created by apple on 5/5/22.
//

import SwiftUI


struct DashboardCardView: View {
    let card: DashboardCard
    let action: () -> Void
    
    init(card: DashboardCard, action: @escaping () -> Void) {
        self.card = card
        self.action = action
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Image(card.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 52)
                .clipShape(Circle())
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .padding(.top, 15)
            VStack(alignment: .leading, spacing: 5) {
                Spacer().frame(height: 10)
                Text(card.title)
                    .font(Font.fontWith(.bold, size: .medium))
                    .foregroundColor(.white)
                
                Text(card.subTitle)
                    .font(Font.fontWith(.semiBold, size: .small))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                HStack {
                    Spacer()
                    Button(card.buttonName, action: {
                        action()
                    })
                    .font(Font.fontWith(.semiBold, size: .small))
                    .frame(width: 100, height: 26)
                    .foregroundColor(.appPrimary)
                    .cornerRadius(40)
                    .clipShape(Capsule())
                    .background(AnyView(Capsule().fill(Color.white)))
                    Spacer().frame(width: 10)
                }
                Spacer().frame(height: 10)
            }
            
        }
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(LinearGradient(gradient: Gradient(colors: [.themeBlueColor, .themeLightColor]), startPoint: .top, endPoint: .bottom))
        )
        .frame(width: 300)
    }
    
}

//struct DashboardCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        DashboardCardView()
//    }
//}
