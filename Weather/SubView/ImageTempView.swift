//
//  ImageTempView.swift
//  Weather
//
//  Created by Alexander Rozhdestvenskiy on 15.10.2021.
//

import SwiftUI

struct ImageTempView: View {
    var body: some View {
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
        }
    }
}
