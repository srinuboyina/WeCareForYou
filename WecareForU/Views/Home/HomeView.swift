//
//  HomeView.swift
//  WecareForU
//
//  Created by RadhaKrishna Vajjha on 20/04/22.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Tab = .Home
}

public enum Tab: String, Identifiable {
    public var id: Int {
        self.hashValue
    }
    
    case Home //= "Home"
    case Slots //= "Slots"
    case Donate = "Donate"
    case Tours = "Tours"
    case User = "Account"
}

struct HomeTabView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    var body: some View {
        TabView(selection: $rootViewModel.selectedTab) {
            HomeDashboardView().environmentObject(rootViewModel)
                .tabItem {
                    Label(Tab.Home.rawValue, image: rootViewModel.selectedTab == Tab.Home ? "homeIcon_selected" : "homeIcon")
                }
                .tag(Tab.Home)
            AvailableSlotsView().environmentObject(rootViewModel)
                .tabItem {
                    Label(Tab.Slots.rawValue, image: rootViewModel.selectedTab == Tab.Slots ? "slot_selected" : "availableSlots")
                }
                .tag(Tab.Slots)
            DonateView()
                .tabItem {
                    Label(Tab.Donate.rawValue, image: rootViewModel.selectedTab == Tab.Donate ? "donateIcon_selected" : "donateTabIcon")
                }
                .tag(Tab.Donate)
            MotivationalTourView()
                .tabItem {
                    Label(Tab.Tours.rawValue, image: rootViewModel.selectedTab == Tab.Tours ? "homeTour_selected" : "homeTour")
                }
                .tag(Tab.Tours)
            AccountView().environmentObject(rootViewModel)
                .tabItem {
                    Label(Tab.User.rawValue, image: rootViewModel.selectedTab == Tab.User ? "account_selected" : "account")
                }
                .tag(Tab.User)
        }
        .accentColor(.appPrimary)
    }
    
}

// struct HomeView: View {
//     @StateObject var viewRouter: ViewRouter
//     @EnvironmentObject var rootViewModel: RootViewModel
//     @State var showPopUp = false
//
//     var body: some View {
//         GeometryReader { geometry in
//              VStack {
//                  Spacer()
//                  switch viewRouter.currentPage {
//                  case .home:
//                      HomeDashboardView()
//                  case .slot:
//                      AvailableSlotsView()
//                  case .tour:
//                     Text("Records")
//                  case .user:
//                      AccountView()
//                  }
//                  Spacer()
//                  HStack {
//                      TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "homeIcon", tabName: Page.home.rawValue)
//                      TabBarIcon(viewRouter: viewRouter, assignedPage: .slot, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "availableSlots", tabName: Page.slot.rawValue)
//                      ZStack {
//                           Circle()
//                               .foregroundColor(.appPrimary)
//                               .frame(width: geometry.size.width/7, height: geometry.size.width/7)
//                               .shadow(radius: 4)
//                          Image("donate")
//                                   .resizable()
//                                   .aspectRatio(contentMode: .fit)
//                                   .frame(width: geometry.size.width/10-10 , height: geometry.size.width/10-10)
//                                   .foregroundColor(Color("themeColor"))
//                       }
//                      .onTapGesture {
//                          withAnimation {
//                              showPopUp.toggle()
//                          }
//                      }
//                      .offset(y: -geometry.size.height/8/2)
//                      TabBarIcon(viewRouter: viewRouter, assignedPage: .tour, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "homeTour", tabName: Page.tour.rawValue)
//
//                      TabBarIcon(viewRouter: viewRouter, assignedPage: .user, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "account", tabName: Page.user.rawValue)
//
//                      NavigationLink(
//                          destination: DonateView(),
//                          isActive: $showPopUp){
//
//                      }
//                   }
//                  .frame(width: geometry.size.width, height: geometry.size.height/8)
////                       .background(Color("themeBGColor").shadow(radius: 2))
//              }
//              .useCustomNavigationBar()
//              .edgesIgnoringSafeArea(.bottom)
//          }
//     }
// }

struct TabBarIcon: View {
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Tab
     let width, height: CGFloat
     let systemIconName, tabName: String
     
     
     var body: some View {
         VStack {
             Image(systemIconName)
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .frame(width: width, height: height)
                 .padding(.top, 10)
             Text(tabName)
                 .font(.footnote)
             Spacer()
         }
         .padding(.horizontal, -4)
         .onTapGesture {
             viewRouter.currentPage = assignedPage
         }
         .foregroundColor(viewRouter.currentPage == assignedPage ? .appPrimary : .gray)
     }
 }

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(viewRouter: ViewRouter())
//    }
//}
