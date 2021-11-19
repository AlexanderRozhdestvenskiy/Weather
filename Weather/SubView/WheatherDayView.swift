//
//  WheatherDayView.swift
//  Weather
//
//  Created by Alexander Rozhdestvenskiy on 15.10.2021.
//

import SwiftUI

struct WeatherDayView: View {
    
    private let viewModel: DailyWeatherRowViewModel
    
    init(viewModel: DailyWeatherRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack() {
            Text("\(viewModel.day)")
                .foregroundColor(.white)
            Text("\(viewModel.month)")
                .foregroundColor(.white)
            Text("\(viewModel.temperature)")
                .foregroundColor(.white)
        }
    }
}
