//
//  CustomButton.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import SwiftUI


struct AppButtonStyle: PrimitiveButtonStyle {
  
    var isOultined  : Bool    = false
    var paddingValue: CGFloat = 10

    func makeBody(configuration: PrimitiveButtonStyleConfiguration) -> some View {
        AppButton(isOultined: isOultined,
                  paddingValue: paddingValue,
                  configuration: configuration)
    }
  
    struct AppButton: View {
        
        // MARK: State properties
        @State var focused   : Bool      = false
               var isOultined: Bool      = false
               var paddingValue: CGFloat = 20

        
        // MARK: - Properties
        let configuration: PrimitiveButtonStyle.Configuration
        
        
        // MARK: - Body
        var body: some View {
            return GeometryReader { geometry in
                RoundedRectangle(
                    cornerRadius: 8,
                    style: .continuous
                )
                .stroke(isOultined ? Color.appPrimary : .clear)
                .overlay(
                    configuration.label
                        .foregroundColor(isOultined ? .appPrimary : .white)
                )
                .background(isOultined ? Color.clear : Color.appPrimary)
                .cornerRadius(8)
                
            }
            .scaleEffect(focused ? 1.1 : 1.0)
            .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            .padding(paddingValue)
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged { value in
                    withAnimation {
                        self.focused = true
                    }
                }
                .onEnded { _ in
                    withAnimation {
                        self.focused = false
                        configuration.trigger()
                    }
                })
        }
    }
}
