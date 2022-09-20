//
//  AppTopTitleView.swift
//  WecareForU
//
//  Created by apple on 4/29/22.
//

import SwiftUI

struct AppTopTitleView: View {
    let title: LocalizedStringKey
    let coloredTitle: LocalizedStringKey
    let subTitle: LocalizedStringKey

    init(title: LocalizedStringKey,
         coloredTitle: LocalizedStringKey,
         subTitle: LocalizedStringKey) {
        self.title        = title
        self.coloredTitle = coloredTitle
        self.subTitle     = subTitle
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
            VStack(alignment: .leading) {
                Text(title)
                    .font(Font.fontWith(.semiBold, size: .extraLarge2))
                    .multilineTextAlignment(.leading)
                Text(coloredTitle)
                    .font(Font.fontWith(.semiBold, size: .extraLarge3))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.appPrimary)
            }
            Text(subTitle)
                .font(Font.fontWith(.semiBold, size: .medium))
        }
    }
}

struct AppTopTitleView_Previews: PreviewProvider {
    static var previews: some View {
        AppTopTitleView(title: "", coloredTitle: "", subTitle: "")
    }
}
