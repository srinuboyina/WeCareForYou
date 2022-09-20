//
//  CreateContactView.swift
//  WecareForU
//
//  Created by apple on 4/25/22.
//

import SwiftUI

struct CreateContactView: View {
    
    @Binding var contactNo: String
    @Binding var ruralOrUrbanSelection: Int
    @Binding var address: String
    @Binding var state: String
    @Binding var pincode: String
    var dropDownData    : DropdownData
    @State private var didLoadAddress = false
    @State private var isLoadingAddress = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading) {
                
                CustomTextField("Please select",
                                text: $contactNo,
                                labelName: "contactNo")
                .padding(10)
                
                SegmentView(title: "ruralOrUrban", data: dropDownData.ruralOrUrban!, selection: $ruralOrUrbanSelection)
                    
                
                CustomTextField("Please select",
                                text: $pincode,
                                labelName: "pincode", onEditingChanged: { status in
                    print("pincode", pincode)
                    if pincode.count > 4 {
                        isLoadingAddress = true
                        Geocode().zipToAddress(zip: pincode) { address in
                            self.address = "\(address.city),\(address.state),\(address.country)"
                            self.state = address.state
                            didLoadAddress.toggle()
                            isLoadingAddress.toggle()
                        } onFail: { err in
                            isLoadingAddress.toggle()
                        }
                    }
                })
                .overlay(isLoadingAddress ? LoadingView().eraseToAnyView(): EmptyView().eraseToAnyView())
                .padding(10)
                
                if didLoadAddress {
                    withAnimation {
                        CustomTextField("Please select",
                                        text: $address,
                                        labelName: "address")
                        .padding(10)
                        .foregroundColor(didLoadAddress ? Color.clear : Color.gray)
                        .disabled(didLoadAddress)
                    }
                    withAnimation {
                        CustomTextField("Please select",
                                        text: $state,
                                        labelName: "state")
                        .padding(10)
                        .foregroundColor(didLoadAddress ? Color.clear : Color.gray)
                        .disabled(didLoadAddress)
                    }
                                      
                }
                
                Spacer()
            }
        }
    }
}

//struct CreateContactView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateContactView(contactNo: <#Binding<String>#>, ruralOrUrbanSelection: <#Binding<Int>#>, address: <#Binding<String>#>, state: <#Binding<String>#>, pincode: <#Binding<String>#>)
//    }
//}
