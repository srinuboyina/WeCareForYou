//
//  IconView.swift
//  WecareForU
//
//  Created by apple on 4/26/22.
//

import SwiftUI

struct IconView: View {
    var imageName: String
    let imageHeight: CGFloat
    let imageWidth: CGFloat
    let circleHeight: CGFloat
    let circleWidth: CGFloat
    let isCircled: Bool
    init(imageName: String,
         imageHeight: CGFloat = 25,
         imageWidth: CGFloat = 25,
         circleHeight: CGFloat = 40,
         circleWidth: CGFloat = 40,
         isCircled: Bool = false)
    {
        self.imageName = imageName
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        self.circleWidth = circleWidth
        self.circleHeight = circleHeight
        self.isCircled = isCircled
    }
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: imageWidth, height: imageHeight)
    }
}
struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(imageName: "")
    }
}
