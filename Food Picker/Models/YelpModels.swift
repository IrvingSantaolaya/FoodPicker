//
//  YelpModels.swift
//  Food Picker
//
//  Created by Irving Martinez on 11/10/19.
//  Copyright © 2019 Irving Martinez. All rights reserved.
//

import Foundation

struct YelpResponse: Identifiable, Codable {
    var businesses: [Business]
    let id = UUID()
}
struct Business: Identifiable, Codable {
    var name: String
    var image_url: String
    var url: String
    let id = UUID()
}
