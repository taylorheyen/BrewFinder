//
//  AddressView.swift
//  BrewFinder
//
//  Created by Taylor Heyen on 4/24/23.
//


import SwiftUI

struct AddressView: View {
    let address1: String?
    let address2: String?
    let city: String
    let state: String
    let postalCode: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if let address1 = address1 {
                Text(address1)
            }
            if let address2 = address2, !address2.isEmpty {
                Text(address2)
            }
            Text("\(city), \(state) \(postalCode)")
        }
    }
}

