//
//  FloatingMenu.swift
//  WecareForU
//
//  Created by apple on 5/6/22.
//

import SwiftUI

struct FloatingMenu: View {
    @State private var showDonateScreen = false
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            Button(action: {
                showDonateScreen.toggle()
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color(red: 153/255, green: 102/255, blue: 255/255))
                    .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
            }
            .padding()
            
            NavigationLink(
                destination: DonateView(),
                isActive: $showDonateScreen){
                
            }
        }
    }
}

struct FloatingMenu_Previews: PreviewProvider {
    static var previews: some View {
        FloatingMenu()
    }
}
