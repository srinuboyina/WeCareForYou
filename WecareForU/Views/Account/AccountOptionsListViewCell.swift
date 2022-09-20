//
//  AccountOptionsListViewCell.swift
//  WecareForU
//
//  Created by apple on 5/4/22.
//

import SwiftUI


struct AccountOptionsListViewCell: View {
    var image: String
    var title: String
    var changeTitleColor: Bool
    var showArrowIcon: Bool
    
    init(image: String,
         title: String,
         changeTitleColor: Bool = false,
         showArrowIcon: Bool = true) {
        self.image = image
        self.title = title
        self.changeTitleColor = changeTitleColor
        self.showArrowIcon = showArrowIcon
    }
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
            Spacer().frame(width: 23)
            Text(LocalizedStringKey(title))
                .foregroundColor(changeTitleColor ? .red : .appDarkGrey)
                .font(Font.fontWith(.semiBold, size: .large))
            Spacer()
            if showArrowIcon {
                Image("arrowIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12, height: 12)
            }
        }
    }
}

struct AccountOptionsListViewCell_Previews: PreviewProvider {
    static var previews: some View {
        AccountOptionsListViewCell(image: "", title: "")
    }
}
