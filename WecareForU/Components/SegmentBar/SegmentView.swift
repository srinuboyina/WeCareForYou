//
//  SegmentView.swift
//  WecareForU
//
//  Created by apple on 4/22/22.
//

import SwiftUI

struct SegmentView: View {
    
    @Binding var selection: Int
    var data: [DropDownBaseResp]
    var name: LocalizedStringKey?

    init(title: LocalizedStringKey, data: [DropDownBaseResp], selection: Binding<Int>) {
        self.name = title
        self.data      = data
        _selection = selection
        self.customizeSegmentAppearance()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(name ?? "Field")
                .font(.fontWith(.regular, size: .small))
                .foregroundColor(.TextField.topLabel)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            Picker("", selection: $selection) {
                ForEach(0..<data.count, id:\.self) { index in
                    Text(self.data[index].name ?? "").tag(index)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 0))
            .frame(height: 40)
            .pickerStyle(SegmentedPickerStyle())
            .scaledToFit()
            .scaleEffect(CGSize(width: 1.2, height: 1.2))
            .frame(maxWidth: .infinity, alignment: .leading)
        }

    }
    
    fileprivate func customizeSegmentAppearance() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .appPrimary
        UISegmentedControl.appearance().setTitleTextAttributes([
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 10, weight: .light)
        ],for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([
            .foregroundColor: UIColor.appPrimary,
            .font: UIFont.systemFont(ofSize: 10, weight: .light)
        ],for: .normal)
    }
}

struct SegmentView_Previews: PreviewProvider {
    @State static var selection: Int = 1

    static var previews: some View {
        SegmentView(title: "title", data: [DropDownBaseResp(name: "", id: "", type: "")], selection: $selection)
    }
}
