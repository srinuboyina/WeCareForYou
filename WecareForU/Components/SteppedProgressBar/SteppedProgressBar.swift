//
//  SteppedProgressBar.swift
//  WecareForU
//
//  Created by apple on 4/25/22.
//

import SwiftUI

enum ProfileTabItems: Int {
    case personal, contact, professional
}

enum ProfileTabTitles: LocalizedStringKey {
    case personalInfo    = "Personal Information"
    case contactDet      = "Contact Details"
    case professionalDet = "Professional Details"
}

struct ProfileTabs {
    let index: Int
    let name: LocalizedStringKey
    
    var id : Int {
        return index
    }
}

struct SteppedProgressBar: View {
    
    let tabs = [ProfileTabs(index: ProfileTabItems.personal.rawValue, name: ProfileTabTitles.personalInfo.rawValue),
                ProfileTabs(index: ProfileTabItems.contact.rawValue, name: ProfileTabTitles.contactDet.rawValue),
                ProfileTabs(index: ProfileTabItems.professional.rawValue, name: ProfileTabTitles.professionalDet.rawValue)]
    @Binding var selectedTab: Int

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Spacer()
                    .frame(width: 20)
                Spacer()
                ForEach(tabs, id: \.id) { tab in
                    Text("\(tab.index + 1)")
                        .frame(width: 6, height: 6, alignment: .center)
                        .foregroundColor(isSelected(tab) ? .white : .appPrimary)
                        .padding(8)
                        .font(.fontWith(.bold, size: .small))
                        .background(
                            Circle()
                                .stroke(Color.appPrimary, lineWidth: 2)
                                .background(isSelected(tab) ? Color.appPrimary : Color.white)
                                .clipShape(Circle())
                                .foregroundColor(isSelected(tab) ? .appPrimary : .white)
                        )
                    if tab.index != 2 { // stop adding spacer bar
                        Spacer()
                        .frame(height: 2)
                        .background(Color.appPrimary)
                    }
                }
                Spacer()
                Spacer()
                    .frame(width: 20)
            }
            
            Text(tabs[selectedTab].name)
                .font(.fontWith(.semiBold, size: .medium))
        }
    }
    
    func isSelected(_ tab: ProfileTabs) -> Bool {
        selectedTab == tab.index
    }
    
}

struct SteppedProgressBar_Previews: PreviewProvider {
    @State static var selectedTab: Int = 0
    static var previews: some View {
        SteppedProgressBar(selectedTab: $selectedTab)
    }
}
