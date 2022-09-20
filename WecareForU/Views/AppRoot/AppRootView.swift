//
//  AppRootView.swift
//  WecareForU
//
//  Created by apple on 4/21/22.
//

import SwiftUI

struct AppRootView: View {
  
  // MARK: - State properties
  @EnvironmentObject var rootView: RootViewModel

  // MARK: - body
    var body: some View {
        if rootView.isAuthenticated {
            HomeTabView()
        }else{
            PagerView()
        }
    }
    
}

// MARK: - Previews

struct AppRootView_Previews: PreviewProvider {
  static var previews: some View {
    AppRootView()
  }
}


// MARK: Language Selection View
struct LanguageSelectionView: View {
  
  // MARK: - Properties
  @EnvironmentObject var languageSettings: LanguageSettings
  @EnvironmentObject var rootView: RootViewModel

  // MARK: - body
  
  var body: some View {
      VStack(alignment: .center) {
          Image("logo")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 150, height: 150)
              .clipShape(Circle())
          Text("About")
            .padding()
            .multilineTextAlignment(.center)
          Text("Select a language")
              .fontWeight(.bold)
              .padding()
          Button("Telugu") {
              withAnimation {
                  languageSettings.selectedLanguage = .te_IN
                  rootView.isLanguageChanged = true
              }
          }
          Button("English") {
              withAnimation {
                  languageSettings.selectedLanguage = .en
                  rootView.isLanguageChanged = true
              }
          }
          Spacer()
      }
    .buttonStyle(AppButtonStyle())
  }
}



// MARK: - Previews

struct LangaugeView_Previews: PreviewProvider {
  static var previews: some View {
      LanguageSelectionView()
  }
}
