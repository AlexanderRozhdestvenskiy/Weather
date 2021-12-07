//
//  WelcomeView.swift
//  Weather
//
//  Created by Alexander Rozhdestvenskiy on 07.12.2021.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Добро пожаловать в приложение Погода")
                    .font(.title)
                    .bold()
                Text("Пожалуйста, сообщите ваше местоположение, чтобы узнать погоду в вашем регионе")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
