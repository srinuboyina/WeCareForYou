//
//  CreateProfileView.swift
//  WecareForU
//
//  Created by apple on 4/21/22.
//

import SwiftUI



struct CreateProfileView<vM>: View where vM : CreateContactDataBindProtocol &
                                              CreatePersonalDataBindProtocol &
                                              CreateProfessionalDataBindProtocol &
                                              CreateProfileViewModelProtocol &
                                              APILoadingStateProtocol
{
    @EnvironmentObject internal var rootViewModel: RootViewModel
    @ObservedObject var viewModel: vM
    @State private var selectedTab = ProfileTabItems.personal.rawValue
    @State private var showThankYouScreen = false
    @State private var showHomeScreen = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Spacer()
            SteppedProgressBar(selectedTab: $selectedTab)
            
            TabView(selection: $selectedTab) {
                
                CreatePersonalView(joiningAs             : $viewModel.joiningAs,
                                   fullName              : $viewModel.fullName,
                                   age                   : $viewModel.age,
                                   genderSegmentSelection: $viewModel.genderSelection,
                                   maritalSegmentSelection: $viewModel.maritalSelection,
                                   dropDownData: (rootViewModel.dropDownData)!)
                .padding(10)
                .tag(ProfileTabItems.personal.rawValue)
                .gesture(DragGesture()) // disable swipe gesture in tabs
                
                CreateContactView(contactNo            : $viewModel.contactNo,
                                  ruralOrUrbanSelection: $viewModel.ruralOrUrbanSelection,
                                  address              : $viewModel.address,
                                  state                : $viewModel.state,
                                  pincode              : $viewModel.pincode,
                                  dropDownData: (rootViewModel.dropDownData)!)
                .padding(10)
                .tag(ProfileTabItems.contact.rawValue)
                .gesture(DragGesture())
                
                
                
                CreateProfessionalView(idNo          : $viewModel.idNo,
                                       occupation    : $viewModel.occupation,
                                       bplSelection  : $viewModel.bplCategorySelection,
                                       careGiversName: $viewModel.careGiversName,
                                       annualIncome  : $viewModel.annualIncome,
                                       education     : $viewModel.education,
                                       careGiversNo  : $viewModel.careGiversNo,
                                       reference     : $viewModel.reference,
                                       patientAdmitType: $viewModel.patientAdmitType,
                                       diagnosis     : $viewModel.diagnosis,
                                       cancerType    : $viewModel.cancerType,
                                       dropDownData: (rootViewModel.dropDownData)!)
                .padding(10)
                .tag(ProfileTabItems.professional.rawValue)
                .gesture(DragGesture())
                
                NavigationLink(
                    destination: GenericView(title: "thankYouTitle", description: "thankYouDesc", screenType: .success, onClick: ({
                        showHomeScreen = true
                    })), isActive: $showThankYouScreen){
                    
                }
                
                NavigationLink(
                    destination: HomeTabView(), isActive: $showHomeScreen) {
                    
                }
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            VStack {
                BottomProfileView(action: {
                    // TODO: make this toggle on service call success
                    if selectedTab == ProfileTabItems.personal.rawValue {
                        withAnimation { selectedTab = ProfileTabItems.contact.rawValue }
                    }else if selectedTab == ProfileTabItems.contact.rawValue {
                        withAnimation { selectedTab = ProfileTabItems.professional.rawValue }
                    }else if selectedTab == ProfileTabItems.professional.rawValue {
                        showThankYouScreen.toggle()
                        //TODO: create profile service call
//                        viewModel.createProfile()
                    }
                }, title: selectedTab != ProfileTabItems.professional.rawValue ? "next" : "submit")
                .foregroundColor(.white)
                .frame(height: 80)
            }
            
        }
        .background(Color.appBg)
//        .ignoresSafeArea(.all)
        .navigationTitle(Text("Complete your profile"))
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showThankYouScreen) {
            Alert(title: Text("Alert"), message: Text("Profile creation is suceess."), dismissButton: .default(Text("Okay"), action: {
                presentationMode.wrappedValue.dismiss()
                rootViewModel.isProfileCompleted = true
            }))
        }
                
    }
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView(viewModel: CreateProfileViewModel())
    }
}
