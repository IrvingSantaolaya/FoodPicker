//
//  YelpModels.swift
//  Food Picker
//
//  Created by Irving Martinez on 11/10/19.
//  Copyright © 2019 Irving Martinez. All rights reserved.
//

import Foundation

struct YelpResponse: Codable {
    var businesses: [Business]?
}
struct Business: Identifiable, Codable {
    var name: String
    var image_url: String
    var url: String
    var id: String
    var rating: Double
    var price: String?
    var review_count: Double
    var phone: String
    var distance: Double
    var coordinates: Coordinates
}

struct Coordinates: Codable {
    var latitude: Double
    var longitude: Double
}
