//
//  OrganizationModel.swift
//  SearchBar+PullToRefreshSwift
//
//  Created by Eugene Berezin on 6/9/21.
//

import Foundation

struct Organization: Codable, Identifiable {
    var id: Int { memberID }
    let memberID: Int
    let createdAt: String
    let type: TypeEnum
    let role: Role
    let isActive: Bool
    let totalAmountDonated: Double
    let lastTransactionAt: String
    let lastTransactionAmount: Double
    let profile: String
    let name: String
    let company, modelDescription: String?
    let image: String?
    let email: String?
    let twitter: String?
    let github: String?
    let website: String?
    let currency: Currency?
    let tier: Tier?

    enum CodingKeys: String, CodingKey {
        case memberID = "MemberId"
        case createdAt, type, role, isActive, totalAmountDonated, lastTransactionAt, lastTransactionAmount, profile, name, company
        case modelDescription = "description"
        case image, email, twitter, github, website, currency, tier
    }
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum Role: String, Codable {
    case backer = "BACKER"
    case fundraiser = "FUNDRAISER"
    case host = "HOST"
}

enum Tier: String, Codable {
    case backer = "Backer"
    case sponsor = "Sponsor"
}

enum TypeEnum: String, Codable {
    case organization = "ORGANIZATION"
}

typealias Org = [Organization]
