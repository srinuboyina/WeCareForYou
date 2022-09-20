//
//  AvailableSlotsView.swift
//  WecareForU
//
//  Created by apple on 5/5/22.
//

import SwiftUI

struct AvailableSlotsView {
    
    @EnvironmentObject var rootViewModel: RootViewModel
    @State private var arrayOfDates = Date().daysOfWeek()
    @State private var selectedDate = Date()

    init() {
        UINavigationBar.changeAppearance(clear: true)
    }
    
}

extension AvailableSlotsView: View {
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        Image("leftArrow")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12, height: 12)
                        ScrollView(.horizontal, showsIndicators: false) {
                               HStack {
                                   ForEach(arrayOfDates, id: \.self) { date in
                                       CalendarCell(date: date)
                                   }
                               }
                           }
                           .frame(height: 100)
                           .padding(20)
                        Image("rightArrow")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12, height: 12)
                    }
                    .foregroundColor(.white)
                    .padding()
                }
                
                VStack(spacing: 20) {
                    Spacer()
                    ForEach(rootViewModel.doctorInfo!.info!.indices) { index in
                        let infoObj = rootViewModel.doctorInfo!.info![index]
                        NavigationLink(destination: DoctorDetailView(data: infoObj, image: UIImage(named: "doctorImage2")!)) {
                            DoctorInfoCellView(imageUrl: posters[0], data: infoObj)
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                        }
                        
                    }
                }
                .background(
                    Color.appBg
                )
            }
            .navigationTitle(Text("Available Slots"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
struct AvailableSlotsView_Previews: PreviewProvider {
    static var previews: some View {
        AvailableSlotsView()
    }
}
