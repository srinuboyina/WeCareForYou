//
//  LoginView.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import SwiftUI

struct LoginView<vM: LoginViewModelProtocol
                    & LoginDataBindProtocol
                    & APILoadingStateProtocol>: View
{
    
    @EnvironmentObject var viewModel: vM
    @EnvironmentObject var rootViewModel: RootViewModel
    @State private var showHomeScreen: Bool = false
    var body: some View {
        ZStack {
            Color.appBg.ignoresSafeArea(.all)
            ScrollView {
                VStack() {
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
                        
                        NavigationLink(destination: ForgotPasswordView<ForgotPasswordViewModel>()
                                        .environmentObject(ForgotPasswordViewModel())) {
                            HStack {
                                Spacer()
                                Button("Forgot Password?") { }
                                .disabled(true)
                                .foregroundColor(.appPrimary)
                                .font(.fontWith(.medium, size: .large))
                                .padding(5)
                            }
                        }
                        
                        /// -------- Login / Submit  -----------
                        
                        Button("Login") {
                            showHomeScreen = true
                            debugPrint("User: \(self.viewModel.username)")
                            debugPrint("Pass: \(self.viewModel.password)")
                            viewModel.signIn()
                            // TODO: toggle on success of login api
                            rootViewModel.isAuthenticated = true
                        }
                        .buttonStyle(AppButtonStyle())
                        
                        /// -------- Create Account  -----------
                        HStack(alignment: .center) {
                            Text("Not Registered?")
                                .font(.fontWith(.regular, size: .medium))
                            
                            NavigationLink(destination: SignUpView<SignUpViewModel>()
                                            .environmentObject(SignUpViewModel())) {
                                Button("Create Account") { }
                                .disabled(true)
                                .foregroundColor(.appPrimary)
                                .font(.fontWith(.medium, size: .large))
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
//                            NavigationLink(
//                                destination: HomeTabView(),
//                                isActive: $showHomeScreen){
//
//                                }
                            
                        }
                    }.padding(20)
                    
                    Spacer()
                }
            }
            .ignoresSafeArea()
            
        }
        .ignoresSafeArea(.all)
        .alert(isPresented: $viewModel.hasError) {
            Alert(
                title: Text("Sign In Failed"),
                message: Text("The email/password combination is invalid.")
            )
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView<LoginViewModel>()
            .environmentObject(LoginViewModel())
    }
}
