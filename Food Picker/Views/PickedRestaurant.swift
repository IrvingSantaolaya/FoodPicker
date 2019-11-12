//
//  PickedRestaurant.swift
//  Food Picker
//
//  Created by Irving Martinez on 11/10/19.
//  Copyright © 2019 Irving Martinez. All rights reserved.
//

import SwiftUI
import CoreLocation
import Combine

struct PickedRestaurant: View {
    var searchTerm: String
    var location: CLLocationCoordinate2D
    @ObservedObject var viewModel = PickedRestaurantViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("You should eat at:")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                Image(uiImage: self.viewModel.imageData != nil ? UIImage(data: self.viewModel.imageData!)! : UIImage())
                    .resizable()
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.4)
                    .aspectRatio(contentMode: .fill)
                Text(self.viewModel.businesses[0].name)
                    .font(.headline)
                    .fontWeight(.heavy)
                ScrollView {
                    HStack {
                        // for each
                        Image(systemName: "apple")
                    }
                }
                Spacer()
            }
        }
        .onAppear {
            self.viewModel.getRestaurants(searchTerm: self.searchTerm, location: self.location)
        }
    }
}

struct PickedRestaurant_Previews: PreviewProvider {
    static var previews: some View {
        PickedRestaurant(searchTerm: "Pizza", location: CLLocationCoordinate2D(latitude: 144.654, longitude: 90.65435))
    }
}
