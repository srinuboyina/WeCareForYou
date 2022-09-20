//
//  DonateView.swift
//  WecareForU
//
//  Created by apple on 5/5/22.
//

import SwiftUI

struct DonateAmount: Identifiable {
    var id = UUID()
    var isSelected: Bool
    var amount: String
    static let example = [DonateAmount(isSelected: false, amount: "50"),
                          DonateAmount(isSelected: false, amount: "100"),
                          DonateAmount(isSelected: false, amount: "500")]
}

struct DonateView {
    @State private var amount: String = ""
    @State private var amountArray = DonateAmount.example
    @State private var isDonateSuccess: Bool = false
    @State private var showLoader: Bool = false
    @Environment(\.presentationMode) var presentationMode

    fileprivate func updateDefaultAmountArraySelection() {
        for i in 0..<self.amountArray.count {
            self.amountArray[i].isSelected =  false
        }
        amount = ""
    }
    
}

extension DonateView: View {
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                VStack(spacing: 30) {
                    Image("donateIcon")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .scaledToFit()
                    
                    Text("The slightest help from you, will mean a lot to them.")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(Font.fontWith(.regular, size: .medium))
                        .foregroundColor(.TextField.textColor)                        

                    Text("How much wanna donate?")
                        .font(Font.fontWith(.semiBold, size: .semiLarge))
                }
                           
                ForEach(amountArray.indices) { index in
                    DonateAmountView(isSelected: $amountArray[index].isSelected, amount: amountArray[index].amount) {
                        updateDefaultAmountArraySelection()
                        self.amountArray[index].isSelected = self.amountArray[index].isSelected ? false : true
                        if self.amountArray[index].isSelected {
                            self.amount = self.amountArray[index].amount
                        }
                    }
                }
                CustomTextField("Enter amount (In Rs.)", text: $amount)
                    .padding(20)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .font(Font.fontWith(.semiBold, size: .semiLarge))
                
                Button("Donate") {
                    showLoader.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                        // TODO: on api success toggle button state
                        withAnimation {
                            isDonateSuccess.toggle()
                            showLoader.toggle()
                        }
                    })
                }
                .buttonStyle(AppButtonStyle())
                .frame(width: 150)
                
                // TODO: Donation - payment screen
                NavigationLink(destination: Text("Donation Success"), isActive: $isDonateSuccess, label: {
                    
                })
            }
            .padding(20)
        }
        .overlay(showLoader ? LoadingView("Loading...").eraseToAnyView(): EmptyView().eraseToAnyView())
        .alert(isPresented: $isDonateSuccess) {
            Alert(title: Text("Success!"), message: Text("Thank you for the donation of amount ₹\(amount)"), dismissButton: .default(Text("Okay"), action: {
                withAnimation {
                    presentationMode.wrappedValue.dismiss()
                    updateDefaultAmountArraySelection()
                }
            }))
        }
        .navigationTitle(Text("Donation"))
        .navigationBarTitleDisplayMode(.inline)
        .dismissKeyboardOnTap()
    }
}

struct DonateView_Previews: PreviewProvider {
    static var previews: some View {
        DonateView()
    }
}

struct DonateAmountView: View {
    let action: () -> Void
    let amount: String
    @Binding var isSelected: Bool
    init(isSelected: Binding<Bool>,
         amount: String,
         action: @escaping () -> Void) {
        self.action = action
        self.amount = amount
        self._isSelected = isSelected
    }
    
    var body: some View {
        Button("₹\(amount)") {
            action()
        }
        .font(Font.fontWith(.semiBold, size: .semiLarge))
        .buttonStyle(isSelected ? AppButtonStyle(): AppButtonStyle(isOultined: true))
    }
    
}
