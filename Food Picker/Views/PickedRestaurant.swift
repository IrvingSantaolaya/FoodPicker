//
//  PickedRestaurant.swift
//  Food Picker
//
//  Created by Irving Martinez on 11/10/19.
//  Copyright © 2019 Irving Martinez. All rights reserved.
//

import SwiftUI
import CoreLocation

struct PickedRestaurant: View {
    var searchTerm: String
    var location: CLLocationCoordinate2D
    @State var winner = ""
    @State var yelpService = YelpService()
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text(self.winner)
            }
        }
        .onAppear {
            self.yelpService.fetchRestaurants(searchTerm: self.searchTerm, location: self.location) { (businesses, error) in
                guard let businesses = businesses else {
                    return
                }
                self.winner = businesses[0].name
            }
        }
    }
}

struct PickedRestaurant_Previews: PreviewProvider {
    static var previews: some View {
        PickedRestaurant(searchTerm: "Pizza", location: CLLocationCoordinate2D(latitude: 144.654, longitude: 90.65435))
    }
}
