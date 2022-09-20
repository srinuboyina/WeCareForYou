//
//  HomeEnquiryView.swift
//  WecareForU
//
//  Created by apple on 4/26/22.
//

import SwiftUI

struct HomeEnquiryView: View {
    let columnGridItem = Array(repeating: GridItem(.adaptive(minimum: 100), spacing: 0), count: 2)
    @State var selectedModel: HomeEnquiryData? = nil
    @State var navigationViewIsActive: Bool = false
    
    let data = [HomeEnquiryData(name: "Medical Enquiry",
                                imageName: "first-aid-kit 1"),
                HomeEnquiryData(name: "Consumable\n Requirements",
                                imageName: "first-aid-kit 2"),
                HomeEnquiryData(name: "Nutrition",
                                imageName: "first-aid-kit 3"),
                HomeEnquiryData(name: "Tele Consultation",
                                imageName: "first-aid-kit 4")]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Enquiry")
                .font(.callout)
                .bold()
                .padding(.bottom, 15)
            if selectedModel != nil {
                // TODO: replace text in destination::: Navigate to particular screen based on model data name or maintain screen names
                
                NavigationLink(destination: Text(selectedModel?.name ?? ""), isActive: $navigationViewIsActive, label: {
                    
                })
            }
            LazyVGrid(columns: columnGridItem, alignment: .center, spacing: 0) {
                ForEach(data, id: \.id) { obj in
                    HomeEnquiryCellView(name: obj.name, imageName: obj.imageName)
                        .onTapGesture {
                            selectedModel = obj
                            navigationViewIsActive = true
                        }
                }
            }
            .frame(width: Constants.EnquiryView.viewWidthAndHeight, height: Constants.EnquiryView.viewWidthAndHeight)
            .background(Color.appBg)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
            .shadow(color: Color.gray.opacity(0.3), radius: 20, x: 0, y: 10)
        }
        .padding(20)
    }
}
struct HomeEnquiryView_Previews: PreviewProvider {
    static var previews: some View {
        HomeEnquiryView()
    }
}
