//
//  TopLogoView.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import SwiftUI

struct TopLogoView: View
{
    var body: some View {
        ZStack{
            Image("topCurvedBgView")
                 .resizable()
                 .scaledToFill()
                 .frame(width: UIScreen.main.bounds.width, height: Constants.Size.topLogoHeight)
                 .ignoresSafeArea(.all)
            VStack(alignment: .center) {
                Image("iconWecareForU")
                     .resizable()
                     .scaledToFit()
                     .frame(width: 55, height: 55)
                Text("We Care")
                    .font(.title2).bold()
                    .foregroundColor(.white)
            }
            .padding()
        }
        .frame(maxWidth:.infinity, maxHeight: Constants.Size.topLogoHeight)
        //.background(Color.appPrimary).ignoresSafeArea(.all)
        .ignoresSafeArea(.all)
    }
    
}


struct TopLogoView_Previews: PreviewProvider {
    static var previews: some View {
        TopLogoView()
    }
}
