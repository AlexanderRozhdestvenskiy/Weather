//
//  WeatherView.swift
//  Weather
//
//  Created by Alexander Rozhdestvenskiy on 19.11.2021.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var viewModel: WeeklyWeatherViewModel
    
    init(viewModel: WeeklyWeatherViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            
            BackgroundView()
            
            VStack {
                
                TextField(" City", text: $viewModel.city)
                    .background(Color.white)
                    .padding()
                    .frame(width: .infinity, height: 64, alignment: .center)
                    .cornerRadius(16)
                
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
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeeklyWeatherViewModel(weatherFetcher: WeatherFetcher()))
    }
}
