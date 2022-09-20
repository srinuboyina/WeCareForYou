//
//  DoctorInfoCellView.swift
//  WecareForU
//
//  Created by apple on 5/5/22.
//

import SwiftUI

// TOD: remove sample server image urls
let posters = [
    "https://image.tmdb.org/t/p/original//pThyQovXQrw2m0s9x82twj48Jq4.jpg",
    "https://image.tmdb.org/t/p/original//vqzNJRH4YyquRiWxCCOH0aXggHI.jpg",
    "https://image.tmdb.org/t/p/original//6ApDtO7xaWAfPqfi2IARXIzj8QS.jpg",
    "https://image.tmdb.org/t/p/original//7GsM4mtM0worCtIVeiQt28HieeN.jpg"
].map { URL(string: $0)! }

struct DoctorInfoCellView: View {
    let imageUrl: URL
    let data: Info
    var isBusy: Bool = false
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
//            AsyncImage(url: imageUrl) {
//                Image("doctorImage2").resizable()
//            } image: { image in
//                Image("doctorImage2").resizable()
//            }
            Image("doctorImage2").resizable()
            .frame(width: 58, height: 58)
            .clipShape(Circle())
            .padding(.leading, 10)
            .padding(.top, 10)
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(data.name ?? "")
                        .font(Font.fontWith(.semiBold, size: .medium))
                        .padding(.top, 5)
                        .foregroundColor(.black)
                    Spacer()
                    if data.isBusy ?? false {
                        Text("Busy")
                           // .font(.systemFont(ofSize: 12))
                    }
                }

                Text(data.specializedIn ?? "")
                    .font(Font.fontWith(.semiBold, size: .small2))
                    .foregroundColor(.appSecondary)
                Text(data.address ?? "")
                    .font(Font.fontWith(.regular, size: .small2))
                    .foregroundColor(.appSecondary)
                HStack {
                    DoctorAvailableTimeView(time: data.availabilityTime ?? "", spacerWidth: 10, fontSize: .small)
                    Spacer()
                    Image("nextArrow")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding(.trailing, 15)
                }
            }
        }
        .frame(height: 118)
        .background(
         RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.white)
            .shadow(color: Color.themeBlueColor, radius: 1, x: 0.5, y: 0.5)
            .shadow(color: Color.white, radius: 2, x: -2, y: -2)
        )
    }
    
}

struct DoctorInfoCellView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorInfoCellView(imageUrl: posters[0], data: Info.example)
    }
}
