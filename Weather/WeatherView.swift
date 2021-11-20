//
//  WeatherView.swift
//  Weather
//
//  Created by Alexander Rozhdestvenskiy on 19.11.2021.
//

import SwiftUI

struct WeatherView: View {
    
    var cities = ["London", "Paris", "Barcelona", "Milan"]
    
    @ObservedObject var viewModel: WeeklyWeatherViewModel
   
    var body: some View {
        NavigationView {
            ZStack {
            
                BackgroundView()
                
                VStack {
                    
                    Picker("City", selection: $viewModel.city) {
                        ForEach(cities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .background(Color.white)
                    .cornerRadius(6)
                    .padding()
                    
                    Text(viewModel.city)
                        .font(.system(size: 32, weight: .medium, design: .default))
                        .foregroundColor(.white)
                        .padding()
                    
                    Spacer()
                     
                    VStack {
                        ForEach(viewModel.dataSource, id: \.self) { data in
                            WeatherDayView(viewModel: data)
                        }
                    }
                    .padding()
                    
                    Spacer()
                }
            }
            .navigationBarTitle("Weather")
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeeklyWeatherViewModel(weatherFetcher: WeatherFetcher()))
    }
}
