//
//  ContentView.swift
//  Weather
//
//  Created by Alexander Rozhdestvenskiy on 15.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var theme = true
    
    var body: some View {
        ZStack {
            BackgroundView(theme: $theme)
            
            VStack {
                ImageTempView()
                    
                Spacer()
                    
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: "88˚")
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: "64˚")
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: "57˚")
                    WeatherDayView(dayOfWeek: "FRI", imageName: "snow", temperature: "99˚")
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sunset.fill", temperature: "60˚")
                }
                
                Spacer()
                    
                ButtonChangeView(theme: $theme)
                    
                Spacer()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
