//
//  ContentView.swift
//  Food Picker
//
//  Created by Irving Martinez on 11/8/19.
//  Copyright © 2019 Irving Martinez. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State var searchTerm = ""
    var body: some View {
        NavigationView {
            VStack {
                // Logo
                Image("Food Picker Logo")
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(50)
                    .padding(.top, 16)
                // Banner to inform user
                Text("Let's start by entering what you feel like eating!")
                    .font(.largeTitle)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding([.leading, .trailing], 16)
                // Underline-style textfield
                VStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Enter a type of food", text: $searchTerm)
                    }
                    Divider()
                }
                .padding()
                .navigationBarTitle("Food Picker", displayMode: .inline)
                // Button to fire API call
                Button(action: {
                    // Action search Yelp
                    
                }) {
                    Text("Search")
                        .padding([.leading, .trailing], 16)
                        .padding([.top, .bottom], 8)
                        .accentColor(Color("lightGreen"))
                        .background(Color("darkGreen"))
                        .cornerRadius(5)
                }
                Spacer()
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
