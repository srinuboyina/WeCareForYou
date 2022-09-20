//
//  HomeTopIconsView.swift
//  WecareForU
//
//  Created by apple on 4/26/22.
//

import SwiftUI


struct HomeTopIconsView: View {
    
    @Binding var notificationAction: Bool
    @Binding var translateAction: Bool
    @Binding var profileViewTap: Bool


    var body: some View {
        ZStack(alignment: .top) {
            AppTopBackgroundView()
            VStack(alignment: .leading, spacing: 30) {
                Spacer()
                HStack {
                    Image("notificationIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .simultaneousGesture(TapGesture().onEnded {
                            notificationAction.toggle()
                        })
                    Spacer()
                    Image("translateLang")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .simultaneousGesture(TapGesture().onEnded {
                            translateAction.toggle()
                        })
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Hi, Smith!")
                        .font(.title2).bold()
                    Text("Let us know how can we help you.")
                        .font(Font.fontWith(.bold, size: .small))
                }
                
                CompleteProfileInfoView {
                    profileViewTap.toggle()
                }
                
            }
            .padding(20)
        }
        .ignoresSafeArea(.all)
        
    }
    
}

//struct HomeTopIconsView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeTopIconsView(notificationAction: <#Binding<Bool>#>, translateAction: <#Binding<Bool>#>, profileViewTap: <#Binding<Bool>#>)
//    }
//}
