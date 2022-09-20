//
//  AccountView.swift
//  WecareForU
//
//  Created by apple on 4/26/22.
//

import SwiftUI

struct AccountView: View {
    
    @State private var openImagePicker = false
    @State private var showLogoutAlert = false
    @EnvironmentObject var rootViewModel: RootViewModel
    let data = Bundle.main.decode([AccountOptions].self, from: "accountOptions.json")
    @StateObject var settingView = LanguageSettings(defaultLanguage: .en)

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    ZStack(alignment: .top) {
                        Image("profileTopBg")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 150)
                        Text("My Account")
                            .foregroundColor(.white)
                            .font(.fontWith(.semiBold, size: .large))
                    }
                    ZStack(alignment: .bottom) {
                        Image("profileDummy")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .shadow(radius: 2)
                            .frame(width: 128, height: 128)
                            .background(
                                Circle()
                                    .trim(from: 0, to: 1.0)
                                    .rotation(.degrees(-90))
                                    .stroke(Color.white ,style: StrokeStyle(lineWidth: 2, lineCap: .butt, dash: [5,3], dashPhase: 0))
                                    .frame(width: 138, height: 138)
                            )
                        Image("cameraIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .padding(.bottom, -20)
                    }
                    .padding(.top, -95)
                    Spacer()
                        .frame(height: 20)
                    VStack(spacing: 10) {
                        Text("Smith Kevin")
                            .foregroundColor(Color.black)
                            .font(Font.fontWith(.semiBold, size: .extraLarge))
                        Text("smithkevin@email.com")
                            .foregroundColor(Color.appLabelColor)
                            .font(Font.fontWith(.semiBold, size: .small))
                    }
                    VStack(spacing: 40) {
                        ForEach(data!, id: \.id) { option in
                            if option == data!.last { // logout
                                AccountOptionsListViewCell(image: option.image,
                                                           title: option.name,
                                                           changeTitleColor: true,
                                                           showArrowIcon: false)
                                    .simultaneousGesture(TapGesture().onEnded {
                                        showLogoutAlert = true
                                    })
                                
                            }else {
                                if option.name == Options.feedback.rawValue {
                                    NavigationLink(destination: FeedbackView()) {
                                        AccountOptionsListViewCell(image: option.image, title: option.name)
                                    }
                                } else if option.name == Options.faq.rawValue {
                                    NavigationLink(destination: FaqView()) {
                                        AccountOptionsListViewCell(image: option.image, title: option.name)
                                    }
                
                                }else if option.name == Options.bookings.rawValue {
                                    NavigationLink(destination: AppointmentBookingsView()) {
                                        AccountOptionsListViewCell(image: option.image, title: option.name)
                                    }
                
                                } else if option.name == Options.changeLanguage.rawValue {
                                     NavigationLink(destination: LanguageManagerView(.deviceLanguage) {
                                         ChangeLanguageView()
                                             .environmentObject(rootViewModel)
                                             .environmentObject(settingView)
                                             .transition(.slide)
                                     }) {
                                         AccountOptionsListViewCell(image: option.image, title: option.name)
                                     }
                                } else if option.name == Options.donation.rawValue {
                                    NavigationLink(destination: DonateView()) {
                                            AccountOptionsListViewCell(image: option.image, title: option.name)
                                    }
                                } else if option.name == Options.notifications.rawValue {
                                    NavigationLink(destination: NotificationView()) {
                                            AccountOptionsListViewCell(image: option.image, title: option.name)
                                    }
                                } else {
                                    NavigationLink(destination: Text(option.name)) {
                                        AccountOptionsListViewCell(image: option.image, title: option.name)
                                    }
                                }
                                
                            }
                        }
                    }.padding(30)
                    
                }
                .alert(isPresented: $showLogoutAlert) {
                    Alert(title: Text("Logout Confirmation"), message: Text("Are you sure?"), primaryButton: .cancel(), secondaryButton: .destructive(Text("Logout"), action: {
                        //                    TODO: Make authentication to nil
                        rootViewModel.isAuthenticated = false
                    }))
                }
            }
            .useCustomNavigationBar()
        }
        
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
