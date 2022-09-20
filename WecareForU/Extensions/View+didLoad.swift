//
//  View+didLoad.swift
//  WecareForU
//
//  Created by apple on 5/10/22.
//

import SwiftUI

extension View {

    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }

}
