//
//  AppTopBackgroundView.swift
//  WecareForU
//
//  Created by apple on 4/29/22.
//

import SwiftUI

struct AppTopBackgroundView: View {
    let imageName: String
    
    init(imageName: String = "homeBg") {
        self.imageName = imageName
    }
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width, height: 244)
    }
}

struct AppTopBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        AppTopBackgroundView()
    }
}
