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
            BackgroundView(firstCoror: theme ? .blue : .black,
                           secondColor: theme ? Color("LightBlue") : .gray)
            
            VStack {
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("76˚")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: "88˚")
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: "64˚")
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: "57˚")
                    WeatherDayView(dayOfWeek: "FRI", imageName: "snow", temperature: "99˚")
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sunset.fill", temperature: "60˚")
                }
                Spacer()
                
                Button {
                    theme.toggle()
                } label: {
                    Text("Change Day Time")
                        .bold()
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .cornerRadius(12)
                }
                
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

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text(temperature)
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var firstCoror: Color
    var secondColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [firstCoror, secondColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
