//
//  YelpService.swift
//  Food Picker
//
//  Created by Irving Martinez on 11/9/19.
//  Copyright © 2019 Irving Martinez. All rights reserved.
//

import Foundation

class YelpService {
    
    private let apiKey = "j_18RJCf4MnqBQNTjA27qfkWllSEVfZSj-uhAjPvEUVbPiEfpSu42S4ibE0MvMR_tDtgwb-Xs5rJopmYWVicY1dP3AIqxQKNY4SbRFlAKFJ2U7PEwg3tIqI2QPTFXXYx"
    private let secret = "Wt-hkiBgfW1576xWpGN_Xg"
    private let baseUrl = "https://api.yelp.com/v3/businesses/search?&categories=restaurants&sort_by=rating&open_now=true&limit=10"
    private var location = "47.6199761,-122.2017558"
    private let radius = "20"
    
}
