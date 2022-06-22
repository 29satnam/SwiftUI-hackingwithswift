//
//  CheckoutView.swift
//  hackingWithSwift
//
//  Created by Satnam on 21/06/22.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    @State private var addLoyalityDetails = false
    @State private var loyalityNumber = ""
    @State private var tipAmount = 0
    @State private var pickupTimeChoice = "Tonight"

    @State private var showingAlert = false


    let paymentTypes = ["Cash", "Credit Card", "Hacking Points"]
    let tipAmounts = [5, 10, 15, 20, 0]
    
    let pickupTiming = ["Now", "Tonight", "Tomorrow Morning"]

    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    var body: some View {
        Form {
            Section(header: Text("Payment Method")) {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add hacking loyality points.", isOn: $addLoyalityDetails.animation())
                if addLoyalityDetails {
                    TextField("Enter your hacking ID", text: $loyalityNumber)
                }
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section(header: Text("Pickup Time")) {
                Picker("When would you like to pickup?", selection: $pickupTimeChoice) {
                    ForEach(pickupTiming, id: \.self) {
                        Text($0)
                    }
                }
            }

            
            Section(header: Text("Total: \(totalPrice)")
                .font(.body)) {
                Button("Confirm order") {
                    showingAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total is \(totalPrice) – thank you!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
