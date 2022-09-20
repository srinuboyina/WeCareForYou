//
//  CreatePersonalView.swift
//  WecareForU
//
//  Created by apple on 4/25/22.
//

import SwiftUI

struct CreatePersonalView: View {
    
    @Binding var joiningAs: String
    @Binding var fullName: String
    @Binding var age: String
    @Binding var genderSegmentSelection: Int
    @Binding var maritalSegmentSelection: Int
    var dropDownData: DropdownData

    var body: some View {
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading) {
                
                DropDownView(selectedValue: $joiningAs, data: dropDownData.joiningAs!, labelName: "joiningAs")
                .padding(5)
                
                CustomTextField("Please select",
                                text: $fullName,
                                labelName: "fullName")
                .padding(5)
                
                DropDownView(selectedValue: $age, data: dropDownData.age!, labelName: "age")
                .padding(5)
                
                SegmentView(title: "gender", data: dropDownData.gender!, selection: $genderSegmentSelection)
                .padding(5)
                
                SegmentView(title: "maritalStatus", data: dropDownData.maritalStatus!, selection: $maritalSegmentSelection)
                .padding(5)
                
                Spacer()
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
        
    }
}

//struct CreatePersonalView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreatePersonalView(joiningAs: <#Binding<String>#>, fullName: <#Binding<String>#>, age: <#Binding<String>#>, genderSegmentSelection: <#Binding<Int>#>, maritalSegmentSelection: <#Binding<Int>#>)
//    }
//}
