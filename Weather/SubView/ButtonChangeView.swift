//
//  ButtonChangeView.swift
//  Weather
//
//  Created by Alexander Rozhdestvenskiy on 15.10.2021.
//

import SwiftUI

struct ButtonChangeView: View {
    
    @Binding var theme: Bool
    
    var body: some View {
        Button {
            theme.toggle()
        } label: {
            Text("Change Day Time")
                .bold()
                .frame(width: 280, height: 50)
                .background(Color.white)
                .cornerRadius(12)
        }
    }
}
