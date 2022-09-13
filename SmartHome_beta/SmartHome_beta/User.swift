//
//  User.swift
//  SmartHome_beta
//
//  Created by Siroratt Suntronsuk on 14/9/2565 BE.
//

import Foundation
import Foundation

struct User: Identifiable, Decodable, Hashable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
            return hasher.combine(id)
        }

    
//    static func == (lhs: User, rhs: User) -> Bool {
//        return lhs.id == rhs.id
//    }
    
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
    var company: Company

    struct Address: Decodable {
        var street: String
        var suite: String
        var city: String
        var zipcode: String
        var geo: Geo

        struct Geo: Decodable {
            var lat: String
            var lng: String
        }
    }

    struct Company: Decodable {
        var name: String
        var catchPhrase: String
        var bs: String
    }
}

