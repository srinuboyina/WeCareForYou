//
//  TopBackButton.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import SwiftUI

public struct TopBackButton: View {
    public var presentationMode: Binding<PresentationMode>
    
    public init(presentationMode: Binding<PresentationMode>) {
        self.presentationMode = presentationMode
    }
    
    public var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color.primary)
            }
        }
    }
}
