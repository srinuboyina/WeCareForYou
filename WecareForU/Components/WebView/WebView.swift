//
//  WebView.swift
//  WecareForU
//
//  Created by apple on 5/8/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url: URL
    @Binding var isLoading: Bool
    
    init(isLoading: Binding<Bool>, url: String) {
        self.url = URL(string: url)!
        self._isLoading = isLoading
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(didStart: {
            isLoading = true
        }, didFinish: {
            isLoading = false
        })
    }
    
    func makeUIView(context: Context) -> WKWebView  {
        let uiView = WKWebView()
        uiView.navigationDelegate = context.coordinator
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        uiView.load(request)
        return uiView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        let didStart: () -> ()
        let didFinish: () -> ()
        
        init(didStart: @escaping () -> (), didFinish: @escaping () -> ()) {
            self.didStart = didStart
            self.didFinish = didFinish
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            didStart()
        }
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            didFinish()
        }
        
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(isLoading: .constant(true), url: "https://")
    }
}
