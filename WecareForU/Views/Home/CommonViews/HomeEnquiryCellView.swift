//
//  HomeEnquiryCellView.swift
//  WecareForU
//
//  Created by apple on 4/26/22.
//

import SwiftUI

struct HomeEnquiryCellView: View {
    let name: LocalizedStringKey
    let imageName: String
    let sectionSize = Constants.EnquiryView.sectionSize
    let tileSize: CGFloat = Constants.EnquiryView.tileSize
    
    var body: some View {
        VStack {
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding(8)
                Text(name)
                    .multilineTextAlignment(.center)
                    .font(Font.fontWith(.regular, size: .small))
            }
            .frame(width: tileSize ,height: tileSize)
            .background(
                RoundedRectangle(cornerRadius: Constants.EnquiryView.radius)
                    .fill(Color.white)
                    .shadow(color: .gray, radius: 2, x: 2, y: 2)
            )
        }
        .frame(width: sectionSize, height: sectionSize)
    }
}

struct HomeEnquiryCellView_Previews: PreviewProvider {
    static var previews: some View {
        HomeEnquiryCellView(name: "", imageName: "")
    }
}
