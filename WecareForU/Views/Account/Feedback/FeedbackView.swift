//
//  FeedbackView.swift
//  WecareForU
//
//  Created by apple on 4/29/22.
//

import SwiftUI

struct FeedbackView: View {
    @State private var feedbackText = ""
    @State private var titleText = ""
    @State private var submitClicked = false
    @Environment (\.presentationMode) var presentationMode
    @State var message = ""
    var body: some View {
        ScrollView {
            ZStack(alignment: .top) {
                AppTopBackgroundView()
                VStack(spacing: 70) {
                    Spacer()
                    HStack {
                        AppTopTitleView(title: "sendYour", coloredTitle: "feedback", subTitle: "Do you have any feedback or wanna share testimonial? It really matters to us!")
                        Spacer()
                    }
                    VStack(spacing: 10) {
                        HStack {
                            TextFieldLabel(name: "Title")
                            Spacer()
                        }
                        CustomTextField("Enter Title", text: $titleText)
                        HStack {
                            TextFieldLabel(name: "Your message")
                            Spacer()
                        }
                        AppTextEditor(message: $feedbackText, placeholder: "Please enter your feedback")
                            .foregroundColor(.TextField.textColor)
                            .background(Color.white)
                            .cornerRadius(6)
                            .shadow(color: .TextField.darkShadow, radius: 1, x: 1, y: 1)
                            .shadow(color: .TextField.lightShadow, radius: 1, x: -1, y: -1)
                        Button("submit") {
                            submitClicked.toggle()
                        }.buttonStyle(AppButtonStyle())
                        
                    }
                    
                }
                .padding(20)
                
            }
            
        }.ignoresSafeArea()
    }
    
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}

/**
 if submitClicked {
     if presentationMode.wrappedValue.isPresented {
         presentationMode.wrappedValue.dismiss()
     }
 }
 */
