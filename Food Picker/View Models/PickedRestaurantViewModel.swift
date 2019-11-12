//
//  PickedRestaurantViewModel.swift
//  Food Picker
//
//  Created by Irving Martinez on 11/11/19.
//  Copyright © 2019 Irving Martinez. All rights reserved.
//
import Foundation
import CoreLocation
import Combine

class PickedRestaurantViewModel: ObservableObject {
    @Published var businesses: [Business] = [.init(name: "Thinking...", image_url: "kjhsdfh", url: "sdfsdfd")]
    @Published var imageData: Data?
    
    let yelpService = YelpService()
    
    func getRestaurants(searchTerm: String, location: CLLocationCoordinate2D) {
        yelpService.fetchRestaurants(searchTerm: searchTerm, location: location) { (businesses, error) in
            
            guard let businesses = businesses?.shuffled() else {
                #warning("TODO: Handle error")
                return
            }
            self.businesses = businesses
            self.getMainImage(url: businesses[0].image_url)
        }
    }
    
    func getMainImage(url: String) {
        yelpService.fetchRestaurantImage(url: url) { (data, error) in
            guard let data = data else {
                #warning("TODO: Handle error")
                return
            }
            self.imageData = data
        }
    }
    
}
