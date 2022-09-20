//
//  DropDownView.swift
//  WecareForU
//
//  Created by apple on 4/28/22.
//

import SwiftUI

struct DropDownView: View {
    @State private var isExpanded = false
    @Binding var selectedValue: String
    var data: [DropDownBaseResp]
    var labelName: LocalizedStringKey

    var body: some View {
        VStack(alignment: .leading) {
            TextFieldLabel(name: labelName)
            DisclosureGroup(selectedValue.isEmpty ? "Please Select" : selectedValue, isExpanded: $isExpanded) {
                ScrollView {
                    VStack() {
                        ForEach(0 ..< data.count, id:\.self) { value in
                            Text(self.data[value].name ?? "")
                                .tag(value)
                                .font(.fontWith(.medium, size: .large))
                                .foregroundColor(.appDarkGrey)
                                .padding(10)
                                .frame(maxWidth: .infinity)
                                .onTapGesture {
                                    selectedValue = data[value].name ?? ""
                                    withAnimation {
                                        isExpanded.toggle()
                                    }
                                }
                        }
                        
                    }
                    
                }
                .frame(height: Constants.DropDown.scrollHeight)
                
            }
            .font(.callout)
            .foregroundColor(isExpanded ? .appDarkGrey : .gray)
            .padding(10)
            .background(Color.white)
            .cornerRadius(6)
            .shadow(color: .TextField.darkShadow, radius: 1, x: 1, y: 1)
            .shadow(color: .TextField.lightShadow, radius: 1, x: -1, y: -1)
            
        }
    }
    
}

//struct DropDownView_Previews: PreviewProvider {
//    static var previews: some View {
//        DropDownView(data: [""], labelName: "")
//    }
//}
