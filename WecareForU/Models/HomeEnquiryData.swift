//
//  HomeEnquiryData.swift
//  WecareForU
//
//  Created by apple on 4/26/22.
//

import SwiftUI

struct HomeEnquiryData: Identifiable {
    var id = UUID().uuidString
    
    let name     : LocalizedStringKey
    let imageName: String
    
    init(name: LocalizedStringKey, imageName: String) {
        self.name      = name
        self.imageName = imageName
    }
   
}
