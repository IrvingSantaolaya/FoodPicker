//
//  YelpService.swift
//  Food Picker
//
//  Created by Irving Martinez on 11/9/19.
//  Copyright © 2019 Irving Martinez. All rights reserved.
//

import Foundation
import CoreLocation


struct YelpService{
     
    func fetchRestaurants(searchTerm: String, location: CLLocationCoordinate2D, completion: @escaping([Business]?, Error?)->Void) {
        let termWithoutNumbers = searchTerm.components(separatedBy: CharacterSet.decimalDigits).joined()
        let finalTerm = String(termWithoutNumbers.filter { !" \n\t\r".contains($0) })
        let computedUrl = "\(Strings.baseUrlString)&latitude=\(location.latitude)&longitude=\(location.longitude)&term=\(finalTerm)"
        
        guard let url = URL(string: computedUrl) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(Strings.headerValue, forHTTPHeaderField: Strings.headerKey)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            do {
                let businessResponse = try JSONDecoder().decode(YelpResponse.self, from: data)
                DispatchQueue.main.async {
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
}
