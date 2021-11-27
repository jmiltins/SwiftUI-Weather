//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by janis.miltins on 27/11/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //ZStack is layers, just 10 views
        ZStack {
            //Background + edges Color(.blue) just blue or
            //Gradient colors: [.blue, .red, .white]
            LinearGradient(gradient: Gradient(colors: [.blue, Color("lightBlue")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            // to get to the edges
                .edgesIgnoringSafeArea(.all)
            
            // vstack - vertical stack
            VStack{
                Text("Cuppertino, CA")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()//around the text .bottom or 100
                //.frame(width: 200, height: 200)
                //.background(Color.red)
                VStack(spacing: 10){
                    Image(systemName: "cloud.sun.fill")// cmd+Shift+C to copy the string
                        .renderingMode(.original)//for roiginal color
                        .resizable()
                        .aspectRatio(contentMode: .fit)//fi fill in the square - fill equaly
                        .frame(width: 180, height: 180)
                    
                    Text("76°")
                        .font(.system(size: 70, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
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
                    print("Button tapped")
                    
                }label: {
                    Text("Change day time")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.blue)//font color
                        .frame(width: 280, height: 50)
                        .background(Color.white) //frame color
                        .cornerRadius(10)
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
