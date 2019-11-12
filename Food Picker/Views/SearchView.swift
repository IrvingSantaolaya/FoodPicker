//
//  ContentView.swift
//  Food Picker
//
//  Created by Irving Martinez on 11/8/19.
//  Copyright © 2019 Irving Martinez. All rights reserved.
//

import SwiftUI
import CoreLocation

struct SearchView: View {
    @State var showingWinner = false
    @State var searchTerm = ""
    @State var location = CLLocationCoordinate2D(latitude: 47.578651, longitude: -122.165176)
    let locationManager = CLLocationManager()
    
    var body: some View {
        NavigationView {
            VStack {
                // Logo
                Image(Strings.foodPickerLogo)
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(10)
                    .padding(.top, 16)
                // Banner to inform user
                Text(Strings.bannerText)
                    .font(.largeTitle)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding([.leading, .trailing], 16)
                // Underline-style textfield
                VStack {
                    HStack {
                        Image(systemName: Strings.textfieldSymbol)
                            .foregroundColor(.gray)
                        TextField(Strings.textfieldPlaceholder, text: $searchTerm)
                    }
                    Divider()
                }
                .padding()
                .navigationBarTitle("Food Picker", displayMode: .inline)
                // Button to fire API call
                Button(action: {
                    // Action search Yelp
                    self.showingWinner.toggle()
                }) {
                    Text("Search")
                        .padding([.leading, .trailing], 16)
                        .padding([.top, .bottom], 8)
                        .accentColor(Color(.white))
                        .background(Color("darkBlue"))
                        .cornerRadius(5)
                }.disabled(searchTerm.isEmpty)
                Spacer()
            }
            .sheet(isPresented: $showingWinner) {
                PickedRestaurant(searchTerm: self.searchTerm, location: self.location)
            }
            
        }
        .onAppear {
            self.setupLocation()
            
        }
    }
    
    fileprivate func setupLocation() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            guard let currentLocation = self.locationManager.location?.coordinate else {
                #warning("TODO: Handle error")
                return
            }
            self.location = currentLocation
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
