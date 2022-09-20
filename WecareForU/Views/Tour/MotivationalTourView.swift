//
//  MotivationalTourView.swift
//  WecareForU
//
//  Created by apple on 5/8/22.
//

import SwiftUI

struct Video: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var link: String
    static let example = [
        Video(title: "‘Just never give up’: message from a cancer survivor", link: "https://www.youtube.com/embed/MmbDV32lSyw"),
        Video(title: "How to Fight Through the Worst of Times | Michael Crossland | Goalcast", link: "https://www.youtube.com/embed/vqvFrBZS00c"),
        Video(title: "An Inspiring Story - Cancer Survivor", link: "https://www.youtube.com/embed/dF3obqTIfZs"),
        Video(title: "Cancer Survivor Shares Inspirational Message", link: "https://www.youtube.com/embed/xiyBoQEATCA"),
        Video(title: "WHEN LIFE HURTS - Powerful Motivational Speech", link: "https://www.youtube.com/embed/UrfpkvvRTns"),
        Video(title: "Sofia Vergara BEAT CANCER! Best Motivational Video - Cancer Survivor Success Story", link: "https://www.youtube.com/embed/d7UHlUitiRE")]
}

struct MotivationalTourView: View {
    let motivationalVideos = Video.example
    @State var showLoading = false
    
    init() {
       
    }
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(motivationalVideos) { video in
                        VStack(alignment: .leading, spacing: 15) {
                            WebView(isLoading: $showLoading, url: video.link)
                                .overlay(showLoading ? LoadingView("Loading...").eraseToAnyView(): EmptyView().eraseToAnyView())
                                .frame(height: 150)
                                .cornerRadius(15)
                            Text(video.title)
                                .font(Font.fontWith(.semiBold, size: .medium))
                                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
                        }.background(
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.white)
                                .shadow(color: Color.themeBlueColor, radius: 2, x: 0, y: 1)
                                .shadow(color: Color.white, radius: 10, x: 0, y: 0)
                        )
                        
                    }
                    
                }
                .padding(10)
            }
            .navigationTitle("Motivational Tour")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

struct MotivationalTourView_Previews: PreviewProvider {
    static var previews: some View {
        MotivationalTourView()
    }
}


