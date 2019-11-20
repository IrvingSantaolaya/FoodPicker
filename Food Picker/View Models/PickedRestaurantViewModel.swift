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
    @Published var businesses: [Business] = [Business(name: "", image_url: "", url: "", id: "", rating: 5.0, review_count: 0.0, phone: "", distance: 1.0, coordinates: Coordinates(latitude: 1.0, longitude: 1.0))]
    @Published var imageData: Data?
    @Published var stars = ["star","star","star","star","star"]
    
    let yelpService = YelpService()
    
    func getRestaurants(searchTerm: String, location: CLLocationCoordinate2D) {
        yelpService.fetchRestaurants(searchTerm: searchTerm, location: location) { (businesses, error) in
            
            guard let businesses = businesses?.shuffled() else {
                print(error)
                #warning("TODO: Handle error")
                return
            }
            self.businesses = businesses
            self.stars = self.createStars(num: businesses[0].rating)
            print(self.stars)
            self.getMainImage(url: businesses[0].image_url)
        }
    }
    
    func getMainImage(url: String) {
        yelpService.fetchRestaurantImage(url: url) { (data, error) in
            guard let data = data else {
                print(error)
                #warning("TODO: Handle error")
                return
            }
            self.imageData = data
        }
    }
    
        // This will give array to hold stars values
        func createStars(num: Double) -> [String]{
            var starsArray = [String]()
            // Check to see if there will be a half star
            let remainder = num.truncatingRemainder(dividingBy: 1)
            // Check the amount of stars
            let base = Int(num.rounded(.down))
            // Check the amount of empty stars
            for _ in 1...base {
                starsArray.append("star.fill")
            }
            if remainder != 0 {
                starsArray.append("star.lefthalf.fill")
            }
            if num < 5 {
                let empty = 5 - (Int(num.rounded(.up)))
                for _ in 1..<empty + 1 {
                    starsArray.append("star")
                }
            }
            return starsArray
        }
    
    
}
