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
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                Image(uiImage: (self.viewModel.imageData != nil ? UIImage(data: self.viewModel.imageData!)! : UIImage(named: "placeholder"))!)
                    .resizable()
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.4)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(10)
                Text(self.viewModel.businesses[0].name)
                    .font(.headline)
                    .fontWeight(.heavy)
                HStack {
                    Text(self.viewModel.businesses[0].price ?? "")
                        .foregroundColor(.green)
                        .fontWeight(.heavy)
                    Spacer()
                    HStack {
                        ForEach(0..<5) { i in
                            Image(systemName: self.viewModel.stars[i])
                                .foregroundColor(.yellow)
                        }
                    }
                }
                .padding()
                
                Button(action: {
                    if let url = URL(string: self.viewModel.businesses[0].url) {
                        UIApplication.shared.open(url)
                    }
                    else {
                        print("Could not open url")
                    }
                }) {
                    Text("View on Yelp")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color(.red))
                    .cornerRadius(5)
                }
                Spacer()
            }
        }
        .background(Image("background2")
        .aspectRatio(contentMode: .fit))

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
