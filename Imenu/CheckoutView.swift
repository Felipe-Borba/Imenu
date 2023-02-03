//
//  CheckoutView.swift
//  Imenu
//
//  Created by Felipe Silva de Borba on 02/02/23.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    let paymentTypes = ["Cash", "Credit Card", "iDev Points"]
    @State private var paymentType = "Cash"
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    let tipAmounts = [10, 15, 20, 25, 0]
    @State private var tipAmount = 15
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes,  id: \.self) {
                        Text($0)
                    }
                }
                
                Toggle("Add iDev loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDev ID", text: $loyaltyNumber)
                }
            }
            
            Section("Add a tip?") {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Total $100") {
                Button("Confirm Order") {
                    // TODO: place the order
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}