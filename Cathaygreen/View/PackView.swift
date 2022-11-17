//
//  PackView.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 14/11/2022.
//

import SwiftUI

struct PackView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            PageHeadingView(name: "PACK GREENER")
            
            Text("Average weight")
                .font(.custom("Helvetica Neue Bold", size: 16))
                .foregroundColor(Color.accentColor)
            weightRectView(weight: 20)
            
            Text("Weather on destination")
                .font(.custom("Helvetica Neue Bold", size: 16))
                .foregroundColor(Color.accentColor)
            weatherRectView(weather: "Cloudy", temp: "15-23 °C")

            Text("Suggestions")
                .font(.custom("Helvetica Neue Bold", size: 16))
                .foregroundColor(Color.accentColor)
            suggestionRectView(numShirts: 5, numPants: 3, numJackets: 1)
            
            Text("20 miles reward per 1kg reductions.")
                .font(.custom("Helvetica Neue", size: 16))
                .foregroundColor(Color.accentColor)
        }
    }
    
    private func weightRectView(weight: Int) -> some View {
        ZStack {
            GeneralRect().padding([.leading, .trailing], 60)
            HStack {
 
            }
        }
    }
    private func weatherRectView(weather: String, temp: String) -> some View {
        ZStack {
            GeneralRect().padding([.leading, .trailing], 30)
            HStack {
                Text(weather)
                    .font(.custom("Helvetica Neue Bold", size: 24))
                    .foregroundColor(Color.accentColor)
                // Image
                Text(temp)
                    .font(.custom("Helvetica Neue Bold", size: 24))
                    .foregroundColor(Color.accentColor)
            }
        }
    }
    private func suggestionRectView(numShirts: Int, numPants: Int, numJackets: Int) -> some View {
        ZStack {
            GeneralRect().padding([.leading, .trailing], 30)
            HStack {
                VStack {
                    Text("\(numShirts)")
                        .font(.custom("Helvetica Neue Bold", size: 24))
                        .foregroundColor(Color.accentColor)
                    Text("SHIRTS")
                        .font(.custom("Helvetica Neue", size: 24))
                        .foregroundColor(Color.accentColor)
                }
                VStack {
                    Text("\(numPants)")
                        .font(.custom("Helvetica Neue Bold", size: 24))
                        .foregroundColor(Color.accentColor)
                    Text("PANTS")
                        .font(.custom("Helvetica Neue", size: 24))
                        .foregroundColor(Color.accentColor)
                }
                VStack {
                    Text("\(numJackets)")
                        .font(.custom("Helvetica Neue Bold", size: 24))
                        .foregroundColor(Color.accentColor)
                    Text("JACKETS")
                        .font(.custom("Helvetica Neue", size: 24))
                        .foregroundColor(Color.accentColor)
                }
            }
        }
    }

}

struct PackView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            PackView().environmentObject(ViewRouter())
        }
    }
}
