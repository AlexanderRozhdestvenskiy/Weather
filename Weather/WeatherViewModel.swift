//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Alexander Rozhdestvenskiy on 19.11.2021.
//

import SwiftUI
import Combine

class WeeklyWeatherViewModel: ObservableObject, Identifiable {
    
    @Published var city: String = ""
    @Published var dataSource: [DailyWeatherRowViewModel] = []
    
    private let weatherFetcher: WeatherFetchable
    
    private var disposable = Set<AnyCancellable>()
    
    init(weatherFetcher: WeatherFetchable, scheduler: DispatchQueue = DispatchQueue(label: "WeatherViewModel")) {
        self.weatherFetcher = weatherFetcher
        $city
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .sink(receiveValue: fetchWeather(forCity:))
            .store(in: &disposable)
    }
    
    func fetchWeather(forCity city: String) {
        weatherFetcher.weeklyWeatherForecast(forCity: city)
            .map { response in response.list.map(DailyWeatherRowViewModel.init) }
            .map(Array.removeDuplicates)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.dataSource = []
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] forecast in
                guard let self = self else { return }
                
                self.dataSource = forecast
            })
            .store(in: &disposable)
    }
}

struct DailyWeatherRowViewModel: Identifiable {
    private let item: WeeklyForecastResponse.Item
    
    var id: String {
        return day + temperature + title
    }
    
    var day: String {
        return dayFormatter.string(from: item.date)
    }
    
    var month: String {
        return monthFormatter.string(from: item.date)
    }
    
    var temperature: String {
        return String(format: "%.1f", item.main.temp)
    }
    
    var title: String {
        guard let title = item.weather.first?.main.rawValue else { return "" }
        return title
    }
    
    var fullDescription: String {
        guard let description = item.weather.first?.weatherDescription else { return "" }
        return description
    }
    
    init(item: WeeklyForecastResponse.Item) {
        self.item = item
    }
}

extension DailyWeatherRowViewModel: Hashable {
    static func == (lhs: DailyWeatherRowViewModel, rhs: DailyWeatherRowViewModel) -> Bool {
        return lhs.day == rhs.day
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.day)
    }
}
