//
//  HomeDashboardView.swift
//  WecareForU
//
//  Created by apple on 4/26/22.
//

import SwiftUI

struct HomeDashboardView: View {
    @State var notificationAction: Bool =  false
    @State var translateAction: Bool = false
    @State var profileViewTap: Bool = false
    @EnvironmentObject var rootView: RootViewModel
    @State var registerTapped: Bool = false
    @State var bookSlotTapped: Bool = false
    @StateObject var settingView = LanguageSettings(defaultLanguage: .en)
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HomeTopIconsView(notificationAction: $notificationAction,
                                     translateAction: $translateAction,
                                     profileViewTap: $profileViewTap)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing:10)
                        {
                            DashboardCardView(card: DashboardCard.example) {
                                withAnimation { registerTapped.toggle()
                                }
                            }
                            DashboardCardView(card: DashboardCard.example2) {
                                withAnimation {
                                    rootView.selectedTab = Tab.Slots
                                }
                            }
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    HomeEnquiryView()
                    //Spacer()
                }
                
                NavigationLink(destination: CreateProfileView(viewModel: CreateProfileViewModel()).environmentObject(rootView), isActive: $profileViewTap, label: {
                    
                })
                // TODO: Register screen
                NavigationLink(destination: Text("Register"), isActive: $registerTapped, label: {
                    
                })
                
                NavigationLink(destination: NotificationView(), isActive: $notificationAction, label: {
                    
                })
                
                NavigationLink(destination: LanguageManagerView(.deviceLanguage) {
                    ChangeLanguageView()
                        .environmentObject(rootView)
                        .environmentObject(settingView)
                        .transition(.slide)
                }, isActive: $translateAction, label: {
                    
                })
            }
            .navigationBarHidden(true)
            .ignoresSafeArea(.all)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct HomeDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeDashboardView()
    }
}
