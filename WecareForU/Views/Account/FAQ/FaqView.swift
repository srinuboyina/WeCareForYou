//
//  FaqView.swift
//  WecareForU
//
//  Created by apple on 5/11/22.
//

import SwiftUI

struct FaqView: View {
    @State private var showLoading = false
    var body: some View {
        ZStack(alignment: .top) {
            AppTopBackgroundView()
            VStack {
                WebView(isLoading: $showLoading, url: Constants.Url.faq)
                    .overlay(showLoading ? LoadingView("Loading...").eraseToAnyView(): EmptyView().eraseToAnyView())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .navigationTitle(Text("Frequently asked questions"))
        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea(.all)
    }
}

struct FaqView_Previews: PreviewProvider {
    static var previews: some View {
        FaqView()
    }
}
