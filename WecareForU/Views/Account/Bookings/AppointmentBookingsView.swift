//
//  AppointmentBookingsView.swift
//  WecareForU
//
//  Created by apple on 5/11/22.
//

import SwiftUI

struct AppointmentBookingsView: View {

    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack(alignment: .center) {
                Color.appBg
                VStack(spacing: 5) {
                    if rootViewModel.isBookingsFound() {
                        ForEach(rootViewModel.bookings!.indices) { index in
                            let infoObj = rootViewModel.bookings![index]
                            BookingsCellView(data: infoObj, date: Date())
                                .padding(10)
                        }
                    }else {
                        Text("No Bookings found")
                            .frame(height:100)
                    }
                    
                }
            }
            .frame(minHeight: 0,maxHeight: .infinity)
            .navigationBarTitle(
                Text("Your Bookings")
            )
            .cornerRadius(15)
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea(.all)
        }
       
    }
    
}

struct AppointmentBookingsView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentBookingsView()
    }
}
