//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by janis.miltins on 27/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        //ZStack is layers, just 10 views
        ZStack {
            BackgroundView( isNight: $isNight)
            VStack{
                CityTextView(cityName: "Cuoertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "cloud.moon.fill" : "cloud.sun.fill", temperature: 75)
                // vstack - vertical stack
                
                //Spacer() // pushes all the elements down
                
                //days in h stack
                HStack(spacing: 20){
                    
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 88)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 55)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 60)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temperature: 25)
                    
                }
                Spacer()//pushes all to the top, uses all space(MAX) after text
                //Add Button{}label: {}
                Button{
                    //action
                    isNight.toggle()
                    
                }label: {
                    WeatherButton(title: "Change day time",
                                  textColor: isNight ? .black : .blue,
                                  backgroundColor: isNight ? .gray : .white)
                }
                Spacer()//
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            //.padding()//around the text .bottom or 100
            //.frame(width: 200, height: 200)
            //.background(Color.red)
            VStack{
                Image(systemName: imageName)// cmd+Shift+C to copy the string
                    .renderingMode(.original)//for roiginal color
                    .resizable()
                    .aspectRatio(contentMode: .fit)//fi fill in the square - fill equaly
                    .frame(width: 40, height: 40)
                
                Text("\(temperature)°")
                    .font(.system(size: 28, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                
            }
        }
    }
}

struct BackgroundView: View {
    //var to pass in
    @Binding var isNight: Bool
    
    var body: some View {
        
        //Background + edges Color(.blue) just blue or
        //Gradient colors: [.blue, .red, .white]
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        // to get to the edges
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View{
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()//around the text .bottom or 100
        //.frame(width: 200, height: 200)
        //.background(Color.red)
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        
        VStack(spacing: 10){
            Image(systemName: imageName)// cmd+Shift+C to copy the string
                .renderingMode(.original)//for roiginal color
                .resizable()
                .aspectRatio(contentMode: .fit)//fi fill in the square - fill equaly
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium, design: .rounded))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


