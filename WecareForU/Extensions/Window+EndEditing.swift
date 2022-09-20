//
//  Window+EndEditing.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import SwiftUI

extension View {
    
    func endEditing(_ force: Bool) {
        UIApplication.shared.windows.forEach { $0.endEditing(force)}
    }
    
}
