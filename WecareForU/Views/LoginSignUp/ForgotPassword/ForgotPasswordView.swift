//
//  ForgotPasswordView.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import SwiftUI

struct ForgotPasswordView<vM:ForgotPasswordViewModelProtocol &
                            ForgotPasswordDataBindProtocol &
                            APILoadingStateProtocol>: View
{
    
    @EnvironmentObject var viewModel: vM
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                TopLogoView()
                    .frame(height: Constants.Size.topLogoHeight)
                VStack {
                    Text("EnterEmailInstruction")
                        .font(.fontWith(.regular, size: .medium))
                        .foregroundColor(.appLabelColor)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                    // TODO: Email validation
                    CustomTextField("Enter email address",
                                    text: $viewModel.username,
                                    systemImageName: "mail",
                                    onEditingChanged: { status in
                        
                    })
                        .padding(10)
                    
                    Button("Send") {
                        viewModel.sentVerificationEmail()
                    }
                    .buttonStyle(AppButtonStyle())
                    
                    if viewModel.response != nil {
                        // TODO: navigate / dismiss
                        
                    }
                    
                    HStack(alignment: .center) {
                        Text("Remember Password?")
                            .font(.fontWith(.regular, size: .medium))
                        NavigationLink(destination: LoginView<LoginViewModel>()
                                        .environmentObject(LoginViewModel())) {
                            Button("Login") { }
                            .foregroundColor(.appPrimary)
                            .font(.fontWith(.medium, size: .large))
                            .disabled(true)
                        }
                    }
                    
                }.padding(20)
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView<ForgotPasswordViewModel>()
            .environmentObject(ForgotPasswordViewModel())
    }
}
