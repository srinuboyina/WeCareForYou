//
//  ChangeLanguageView.swift
//  WecareForU
//
//  Created by apple on 5/4/22.
//

import SwiftUI

struct ChangeLanguageView: View {
    // MARK: - Properties
    @EnvironmentObject var languageSettings: LanguageSettings
    @EnvironmentObject var rootView: RootViewModel
    @State private var isEnglishSelected = true
    @State private var isTeluguSelected = false
    @Environment (\.presentationMode) var presentationMode
    let arrayOfLanguages: [LocalizedStringKey] = ["English", "తెలుగు"]
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .top) {
                AppTopBackgroundView()
                VStack {
                    Spacer().frame(height: 20)
                    VStack(spacing: 80) {
                        HStack {
                            AppTopTitleView(title: "pickYour", coloredTitle: "language", subTitle: "Choose your language in which you are comfortable.")
                            Spacer()
                        }
                        HStack(spacing: 30) {
                            LanguageSelectionCardView(isSelected: $isEnglishSelected, languageName: arrayOfLanguages[0])
                                .onTapGesture {
                                    isEnglishSelected.toggle()
                                    isTeluguSelected = false
                                }
                            LanguageSelectionCardView(isSelected: $isTeluguSelected, languageName: arrayOfLanguages[1])
                                .onTapGesture {
                                    isTeluguSelected.toggle()
                                    isEnglishSelected = false
                                }
                        }
                        Button("Confirm") {
                            if isTeluguSelected {
                                withAnimation {
                                    languageSettings.selectedLanguage = .te_IN
                                }
                            }else {
                                withAnimation {
                                    languageSettings.selectedLanguage = .en
                                }
                            }
                            withAnimation {
                                rootView.isLanguageChanged = true
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                        .buttonStyle(AppButtonStyle())
                    }
                   
                }
                .padding(.top, 70)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            }
        }
        .ignoresSafeArea()
    }
}

struct ChangeLanguageView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeLanguageView()
    }
}
