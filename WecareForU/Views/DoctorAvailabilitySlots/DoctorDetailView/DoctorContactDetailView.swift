//
//  DoctorContactDetailView.swift
//  WecareForU
//
//  Created by apple on 5/5/22.
//

import SwiftUI

struct DoctorContactDetailView: View {
    let data: ContactDetail
    var body: some View {
        VStack(alignment: .leading) {
            Text("Contact Detail")
            .font(Font.fontWith(.semiBold, size: .medium))
            VStack {
                HStack {
                    Image("email")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                    Spacer().frame(width: 23)
                    Text(data.email ?? "")
                        .foregroundColor(.appDarkGrey)
                        .font(Font.fontWith(.regular, size: .medium))
                    Spacer()
                }
                HStack {
                    Image("phone")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                    Spacer().frame(width: 23)
                    Text(data.phoneNumber ?? "")
                        .foregroundColor(.appDarkGrey)
                        .font(Font.fontWith(.regular, size: .medium))
                    Spacer()
                }
                HStack {
                    Image("location")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                    Spacer().frame(width: 23)
                    Text(data.completeAddress ?? "")
                        .foregroundColor(.appDarkGrey)
                        .font(Font.fontWith(.regular, size: .medium))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
            }
        }
        
    }
    
}

struct DoctorContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorContactDetailView(data: ContactDetail.example)
    }
}
