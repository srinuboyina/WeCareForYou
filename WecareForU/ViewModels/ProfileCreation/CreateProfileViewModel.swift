//
//  CreateProfileViewModel.swift
//  WecareForU
//
//  Created by apple on 4/21/22.
//

import Foundation

protocol CreatePersonalDataBindProtocol   : ObservableObject {
    var joiningAs      : String { get set }
    var fullName       : String { get set }
    var age            : String { get set }
    var gender         : [String] { get set }
    var maritalStatus  : [String] { get set }
}

protocol CreateContactDataBindProtocol    : ObservableObject {
    var contactNo      : String { get set }
    var ruralOrUrban   : [String] { get set }
    var address        : String { get set }
    var state          : String { get set }
    var pincode        : String { get set }
}

protocol CreateProfessionalDataBindProtocol: ObservableObject {
    var idNo           : String { get set }
    var occupation     : String { get set }
    var annualIncome   : String { get set }
    var bplCategory    : [String] { get set }
    var education      : String { get set }
    var careGiversName : String { get set }
    var careGiversNo   : String { get set }
    var reference      : String { get set }
    var patientAdmitType: String { get set }
    var diagnosis      : String { get set }
    var cancerType     : String { get set }
}

protocol CreateProfileViewModelProtocol: ObservableObject {
    var genderSelection : Int { get set }
    var ruralOrUrbanSelection : Int { get set }
    var maritalSelection: Int { get set }
    var bplCategorySelection: Int { get set }
    var response               : CreateProfile? { get set }
    func createProfile()
}

final class CreateProfileViewModel: CreateContactDataBindProtocol &
                                    CreatePersonalDataBindProtocol &
                                    CreateProfessionalDataBindProtocol &
                                    CreateProfileViewModelProtocol &
                                    APILoadingStateProtocol
{
    @Published var joiningAs     : String = ""
    @Published var contactNo     : String = ""
    @Published var address       : String = ""
    @Published var state         : String = ""
    @Published var pincode       : String = ""
    @Published var fullName      : String = ""
    @Published var age           : String = ""
    @Published var idNo          : String = ""
    @Published var occupation    : String = ""
    @Published var annualIncome  : String = ""
    @Published var education     : String = ""
    @Published var careGiversName: String = ""
    @Published var careGiversNo  : String = ""
    @Published var reference     : String = ""
    @Published var patientAdmitType : String = ""
    @Published var diagnosis     : String = ""
    @Published var cancerType    : String = ""
    @Published var response      : CreateProfile?
    @Published var isLoading     = false
    @Published var hasError      = false
    var gender                   : [String] = ["Male", "Female"]
    var maritalStatus            : [String] = ["Married", "Unmarried"]
    var ruralOrUrban             : [String] = ["Rural", "Urban"]
    var bplCategory              : [String] = ["Yes", "No"]

    @Published var genderSelection : Int = 0
    @Published var maritalSelection: Int = 0
    @Published var ruralOrUrbanSelection: Int = 0
    @Published var bplCategorySelection: Int = 0
    private let service          : CreateProfileServiceProtocol
    
    init(service: CreateProfileServiceProtocol = CreateProfileService(),
         response: CreateProfile? = nil)
    {
        self.service  = service
        self.response = response
    }
    
    func createProfile() {
//        guard isValidated() else {
//            return
//        }
        self.isLoading = true
        service.create(requestParams: buildParams()) { [weak self] response, errorr  in
            if errorr == nil {
                self?.isLoading = false
                self?.response = response
            }else {
                self?.isLoading = false
                self?.hasError  = true
            }
        }
    }
    
    private func buildParams() -> [String: Any]
    {
        let params = ["joingAs"      : joiningAs,
                      "contactNo"    : contactNo,
                      "ruralOrUrban" : ruralOrUrban[ruralOrUrbanSelection],
                      "address"      : address,
                      "state"        : state,
                      "pincode"      : pincode,
                      "fullName"     : fullName,
                      "age"          : age,
                      "gender"       : gender[genderSelection],
                      "maritalStatus": maritalStatus[maritalSelection],
                      "idNo"         : idNo,
                      "bplCategory"  : bplCategory[bplCategorySelection],
                      "education"    : education,
                      "annualIncome" : annualIncome,
                      "careGiversName": careGiversName,
                      "careGiversNo" : careGiversNo,
                      "reference"    : reference,
                      "patientAdmitType": patientAdmitType,
                      "diagnosis"    : diagnosis,
                      "cancerType"   : cancerType]
        debugPrint(params)
        return params
    }
    
}
