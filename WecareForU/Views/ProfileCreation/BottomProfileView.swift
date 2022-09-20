//
//  BottomProfileView.swift
//  WecareForU
//
//  Created by apple on 4/25/22.
//

import SwiftUI

struct BottomProfileView: View {
    let action: () -> Void
    let title: LocalizedStringKey
    var body: some View {
        ZStack {
            Color.white
            HStack {
                Button(title, action: action)
                .buttonStyle(AppButtonStyle())
            }
            .frame(maxWidth: .infinity)
            .shadow(color: .appLabelColor, radius: 2, x: 1, y: 1)
        }
    }
}

//struct BottomProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomProfileView(action: <#() -> Void#>, title: <#LocalizedStringKey#>)
//    }
//}
