//
//  CreateProfessionalView.swift
//  WecareForU
//
//  Created by apple on 4/25/22.
//

import SwiftUI

struct CreateProfessionalView: View {
    
    @Binding var idNo: String
    @Binding var occupation: String
    @Binding var bplSelection: Int
    @Binding var careGiversName: String
    @Binding var annualIncome: String
    @Binding var education: String
    @Binding var careGiversNo: String
    @Binding var reference: String
    @Binding var patientAdmitType: String
    @Binding var diagnosis: String
    @Binding var cancerType: String
    var dropDownData: DropdownData

    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack {
                
                CustomTextField("Please select",
                                text: $idNo,
                                labelName: "idNo")
                .padding(10)
                
                DropDownView(selectedValue: $occupation,
                             data: dropDownData.occupation!,
                             labelName: "occupation")
                .padding(5)
                
                SegmentView(title: "bplCategory",
                            data: dropDownData.bplCategory!,
                            selection: $bplSelection)

                DropDownView(selectedValue: $annualIncome,
                             data: dropDownData.annualIncome!,
                             labelName: "annualIncome")
                .padding(5)
                
                DropDownView(selectedValue: $education,
                             data: dropDownData.education!,
                             labelName: "education")
                .padding(5)
                
                CustomTextField("Please select",
                                text: $careGiversName,
                                labelName: "careGiverName")
                .padding(10)
                CustomTextField("Please select",
                                text: $careGiversNo,
                                labelName: "careGiverNumber")
                .padding(10)
               
                DropDownView(selectedValue: $reference,
                             data: dropDownData.reference!,
                             labelName: "reference")
                .padding(5)
                
                DropDownView(selectedValue: $patientAdmitType,
                             data: dropDownData.patientAdmitType!,
                             labelName: "patientAdmitType")
                .padding(5)

                DropDownView(selectedValue: $diagnosis,
                             data: dropDownData.diagnosis!,
                             labelName: "diagnosis")
                .padding(5)
                                                
            }
            
            VStack {
                
                DropDownView(selectedValue: $cancerType,
                             data: dropDownData.cancerType!,
                             labelName: "typeOfCancer")
                .padding(5)
                
            }
        }
        
    }
}

//struct CreateProfessionalView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateProfessionalView(idNo: <#Binding<String>#>, occupation: <#Binding<String>#>, bplSelection: <#Binding<Int>#>, careGiversName: <#Binding<String>#>, annualIncome: <#Binding<String>#>, education: <#Binding<String>#>, careGiversNo: <#Binding<String>#>, reference: <#Binding<String>#>, patientAdmitType: <#Binding<String>#>, diagnosis: <#Binding<String>#>, cancerType: <#Binding<String>#>)
//    }
//}
