//
//  OnboardView.swift
//  WecareForU
//
//  Created by apple on 4/21/22.
//

import SwiftUI

struct OnboardPages: Identifiable {
    var id: String = UUID().uuidString
    let imageName: String
    let title          : LocalizedStringKey
    let description    : LocalizedStringKey
    init(imageName: String, title: LocalizedStringKey, description: LocalizedStringKey) {
        self.imageName   = imageName
        self.title       = title
        self.description = description
    }
    
}

struct PagerView: View {
    @EnvironmentObject var rootView: RootViewModel
    
    let noOfPages = [OnboardPages(imageName: "onboard1", title: "OnboardTitle1", description: "OnboardDescription1"),
                     OnboardPages(imageName: "onboard2", title: "OnboardTitle2", description: "OnboardDescription2"),
                     OnboardPages(imageName: "onboard3", title: "OnboardTitle3", description: "OnboardDescription3")]
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .appPrimary
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.appPrimary.withAlphaComponent(0.2)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TabView {
                    ForEach(noOfPages, id: \.id) { page in
                        OnboardView(imageName: page.imageName, title: page.title, description: page.description)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .padding()
                Spacer()
                HStack() {
                    NavigationLink(destination: SignUpView<SignUpViewModel>()
                                    .environmentObject(SignUpViewModel())) {
                        Button("SignUp") { }
                        .disabled(true)
                        .buttonStyle(AppButtonStyle(isOultined: true))
                    }
                    
                    NavigationLink(destination: LoginView<LoginViewModel>()
                                    .environmentObject(LoginViewModel())) {
                        Button("Login") { }
                        .disabled(true)
                        .buttonStyle(AppButtonStyle())
                    }
                    
                }.padding(10)
                
                Spacer()
                Spacer()
            }
            .useCustomNavigationBar()
            
        }
        .accentColor(.white)
    }
    
}

struct OnboardView: View {
    
    let imageName      : String
    let title          : LocalizedStringKey
    let description    : LocalizedStringKey
    
    var body: some View {
        VStack(spacing: 20) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            Text(description)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 10)
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView(imageName: "onboard1", title: "Hi", description: "Hello")
    }
}
