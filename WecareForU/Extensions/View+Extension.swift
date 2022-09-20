//
//  View+Extension.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import SwiftUI

extension View {
    ///Type erases the view.
    public func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
    
    public func useCustomNavigationBar() -> some View {
        self
            .navigationBarTitle("")
            .navigationBarHidden(true)
    }
    
    public func dismissKeyboardOnTap() -> some View {
        background(Color.clear)
            .onTapGesture {
                endEditing(true)
            }
    }
}

extension UINavigationController {
  open override func viewWillLayoutSubviews() {
    navigationBar.topItem?.backButtonDisplayMode = .minimal
  }
}

extension UINavigationBar {
    static func changeAppearance(clear: Bool) {
        let appearance = UINavigationBarAppearance()
        
        if clear {
            appearance.configureWithTransparentBackground()
        } else {
            appearance.configureWithDefaultBackground()
        }
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
