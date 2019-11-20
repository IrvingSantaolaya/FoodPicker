//
//  YelpService.swift
//  Food Picker
//
//  Created by Irving Martinez on 11/9/19.
//  Copyright © 2019 Irving Martinez. All rights reserved.
//

import Foundation
import Combine
import CoreLocation


struct YelpService{
     
    func fetchRestaurants(searchTerm: String, location: CLLocationCoordinate2D, completion: @escaping([Business]?, Error?)->Void) {
        let termWithoutNumbers = searchTerm.components(separatedBy: CharacterSet.decimalDigits).joined()
        let finalTerm = String(termWithoutNumbers.filter { !" \n\t\r".contains($0) })
        let computedUrl = "\(Strings.baseUrlString)&latitude=\(location.latitude)&longitude=\(location.longitude)&term=\(finalTerm)"
        
        guard let url = URL(string: computedUrl) else {
            #warning("TODO: Handle error")
            return
        }
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(Strings.headerValue, forHTTPHeaderField: Strings.headerKey)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            do {
                let businessResponse = try JSONDecoder().decode(YelpResponse.self, from: data)
                DispatchQueue.main.async {
                    print(data)
                    completion(businessResponse.businesses, nil)
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
    
    func fetchRestaurantImage(url: String, completion: @escaping(Data?, Error?)-> Void) {
        guard let url = URL(string: url) else {
            #warning("TODO: Handle error")
            return
        }
        
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else {
                    completion(nil, error)
                    return
                }
                DispatchQueue.main.async {
                    completion(data, nil)
                }
            }
            task.resume()
        }
    }
