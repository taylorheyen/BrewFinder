//
//  BreweryModel.swift
//  BrewFinder
//
//  Created by Taylor Heyen on 4/24/23.
//

import Foundation

struct BreweryResults: Codable {
    
    let name: String
    let breweryType: String
    let address1: String?
    let address2: String?
    let address3: String?
    let city: String
    let stateProvince: String?
    let postalCode: String
    let websiteUrl: String
    let state: String
    let street: String?
    let latitude: String?
    let longitude: String?

    enum CodingKeys: String, CodingKey {
        case name
        case breweryType = "brewery_type"
        case address1 = "address_1"
        case address2 = "address_2"
        case address3 = "address_3"
        case city
        case stateProvince = "state_province"
        case postalCode = "postal_code"
        case websiteUrl = "website_url"
        case state
        case street
        case latitude
        case longitude
    }
}
