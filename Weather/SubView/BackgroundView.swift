//
//  BackgroundView.swift
//  Weather
//
//  Created by Alexander Rozhdestvenskiy on 15.10.2021.
//

import SwiftUI

struct BackgroundView: View {
    
    @Binding var theme: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [theme ? .blue : .black, theme ? Color("LightBlue") : .gray]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
