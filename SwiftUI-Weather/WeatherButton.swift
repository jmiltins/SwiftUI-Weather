//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by janis.miltins on 28/11/2021.
//
import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor) //frame color
            .foregroundColor(textColor)//font color
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .cornerRadius(10)
    }
}
