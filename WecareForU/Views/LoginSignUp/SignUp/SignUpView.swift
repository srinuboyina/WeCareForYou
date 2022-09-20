//
//  SignUpView.swift
//  WecareForU
//
//  Created by RadhaKrishna Vajjha on 20/04/22.
//

import SwiftUI

struct SignUpView<vM: SignUpViewModelProtocol
                    & SignUpDataBindProtocol
                    & APILoadingStateProtocol>: View
{
    
    @EnvironmentObject var viewModel: vM
    @State private var pushToForgotPassScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.appBg.ignoresSafeArea(.all)
            ScrollView {
                VStack(spacing: 20) {
                    TopLogoView()
                        .frame(height: Constants.Size.topLogoHeight)
                    VStack {
                        CustomTextField("Enter email or mobile number",
                                        text: $viewModel.username,
                                        systemImageName: "person",
                                        labelName: "Email/Mobile",
                                        onEditingChanged: { status in
                            
                        })
                            .padding(5)
                        
                        CustomTextField("password",
                                        text: $viewModel.password,
                                        systemImageName: "lock",
                                        isSecure: true,
                                        labelName: "Password",
                                        onCommit: {
                            
                        })
                            .padding(5)
                        
                        CustomTextField("password",
                                        text: $viewModel.confirmPassword,
                                        systemImageName: "lock",
                                        isSecure: true,
                                        labelName: "Confirm Password",
                                        onCommit: {
                            
                        })
                            .padding(5)
                        
                        /// -------- SignUp / Submit  -----------
                        
                        Button("SignUp") {
                            debugPrint("User: \(self.viewModel.username)")
                            debugPrint("Pass: \(self.viewModel.password)")
                            viewModel.signUp()
                        }
                        .padding()
                        .buttonStyle(AppButtonStyle())
                        
                        /// -------- Create Account  -----------
                        HStack(alignment: .center) {
                            Text("Already have an account?")
                                .font(.fontWith(.regular, size: .medium))
                            
                            NavigationLink(destination: LoginView<LoginViewModel>()
                                            .environmentObject(LoginViewModel())) {
                                Button("Login Now") { }
                                .foregroundColor(.appPrimary)
                                .font(.fontWith(.medium, size: .large))
                                .disabled(true)
                            }
                        }
                        
                        /// -------- Loader display  -----------
                        
                        if viewModel.isLoading {
                            //TODO: replace loader with custom
                            LoadingView()
                        }
                        
                        /// -------- Navigate to SignUp Screen  -----------
                        
                        if (viewModel.response != nil) {
                            //TODO: navigate to next screen
                            
                        }
                        
                    }.padding(20)
                    
                    Spacer()
                    
                }
            }
            .ignoresSafeArea()
            
        }
        .alert(isPresented: $viewModel.hasError) {
            Alert(
                title: Text("SignUp Failed"),
                message: Text("Username Password match error")
            )
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView<SignUpViewModel>()
            .environmentObject(SignUpViewModel())
    }
}
