//
//  WeatherManager.swift
//  Weather
//
//  Created by Alexander Rozhdestvenskiy on 07.12.2021.
//

import Foundation
import CoreLocation

fileprivate let key = "c568fea97c6bf54a45dd1b438198837e"

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ReponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(key)") else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decodedData = try JSONDecoder().decode(ReponseBody.self, from: data)
        
        return decodedData
    }
}
