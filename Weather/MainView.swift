//
//  MainView.swift
//  Weather
//
//  Created by Alexander Rozhdestvenskiy on 07.12.2021.
//

import SwiftUI

struct MainView: View {
    
    var weather: ReponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "˚")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/02/05/06/42/life-is-a-circle-4820233_1280.jpg")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Погода сейчас")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer",
                                   name: "Мин темп",
                                   value: (weather.main.tempMin.roundDouble() + "˚"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer",
                                   name: "Макс темп",
                                   value: (weather.main.tempMax.roundDouble() + "˚"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind",
                                   name: "Мин темп",
                                   value: (weather.wind.speed.roundDouble() + "м/с"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity",
                                   name: "Влажность",
                                   value: (weather.main.humidity.roundDouble() + "%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(.indigo)
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(.indigo)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView(weather: previewWeather)
            MainView(weather: previewWeather)
                .previewDevice("iPhone SE (1st generation)")
        }
    }
}
