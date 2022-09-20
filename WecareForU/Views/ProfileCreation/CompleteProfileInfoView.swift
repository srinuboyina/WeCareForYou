//
//  CompleteProfileInfoView.swift
//  WecareForU
//
//  Created by apple on 4/26/22.
//

import SwiftUI

struct CompleteProfileInfoView: View {
    let profileViewTap: () -> Void

    var body: some View {
        HStack {
            Image("createProfileIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 46, height: 46)
                .padding(8)
            Text("Please complete your profile so that we can provide suitable help to you.")
                .font(Font.fontWith(.regular, size: .small))
            Image("rightArrow")
                .resizable()
                .scaledToFit()
                .frame(width: 14, height: 14)
                .padding(8)
        }
        .onTapGesture {
            profileViewTap()
        }
        .frame(height: 69)
        .background(
            RoundedRectangle(cornerRadius: 20)
             .fill(Color.white)
            .shadow(color: .gray, radius: 2, x: 2, y: 2)
        )
    }
}

struct CompleteProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteProfileInfoView(profileViewTap: {
            
        })
    }
}
