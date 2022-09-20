//
//  GenericView.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import SwiftUI

enum ScreenType: String {
    case error    = "Skip"
    case success  = "Explore Now"
    case emailSucess = "Login Now"
    case none = "none"
}

struct GenericView: View {
    
    private var title: LocalizedStringKey
    private var description: LocalizedStringKey
    private var imageName: String
    @State private var screenType: ScreenType
    public let onClick: () -> Void
    
    init(imageName: String = "",
         title: LocalizedStringKey,
         description: LocalizedStringKey,
         screenType: ScreenType = .none,
         onClick: @escaping () -> Void)
    {
        self.title       = title
        self.imageName   = imageName
        self.description = description
        self.screenType  = screenType
        self.onClick     = onClick
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.appBg
                .ignoresSafeArea()
            VStack(alignment: .center) {
                Spacer()
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .padding(5)
                Text(title)
                    .font(.fontWith(.medium, size: .large))
                    .foregroundColor(.black)
                    .padding(5)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(description)
                    .font(.fontWith(.regular, size: .medium))
                    .foregroundColor(.appLabelColor)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)

                Spacer()
                Button(screenType.rawValue) {
                    onClick()
                }
                .buttonStyle(AppButtonStyle())
            }
            .padding(20)
        }
        .useCustomNavigationBar()
       
    }
}

struct GenericView_Previews: PreviewProvider {
    static var previews: some View {
        GenericView(title: "Hello", description: "Happy see you!", screenType: .error, onClick: ({
            
        }))
    }
}
