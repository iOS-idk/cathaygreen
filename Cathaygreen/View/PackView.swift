//
//  PackView.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 14/11/2022.
//

import SwiftUI

struct PackView: View {
    var body: some View {
        ZStack {
            ContentView()
            
            VStack {
                
                ZStack {
                    GeneralRect()
                    HStack {
                        Text("PACK")
                            .font(.custom("Helvetica Neue Bold", size: 34))
                            .foregroundColor(Color.accentColor)
                        Text("GREENER")
                            .font(.custom("Helvetica Neue Bold", size: 34))
                            .foregroundColor(Color.accentColor)
                    }
                }
                
                Text("Average weight")
                    .font(.custom("Helvetica Neue Bold", size: 16))
                    .foregroundColor(Color.accentColor)
                ZStack {
                    GeneralRect(rectWidth: 240)
                    HStack {
         
                    }
                }
                
                Text("Weather on destination")
                    .font(.custom("Helvetica Neue Bold", size: 16))
                    .foregroundColor(Color.accentColor)
                ZStack {
                    GeneralRect(rectWidth: 330)
                    HStack {
                        Text("Cloudy")
                            .font(.custom("Helvetica Neue Bold", size: 24))
                            .foregroundColor(Color.accentColor)
                        // Image
                        Text("15-23 C")
                            .font(.custom("Helvetica Neue Bold", size: 24))
                            .foregroundColor(Color.accentColor)
                    }
                }
        
                Text("Suggestions")
                    .font(.custom("Helvetica Neue Bold", size: 16))
                    .foregroundColor(Color.accentColor)
                ZStack {
                    GeneralRect(rectWidth: 330)
                    HStack {
                        VStack {
                            Text("5")
                                .font(.custom("Helvetica Neue Bold", size: 24))
                                .foregroundColor(Color.accentColor)
                            Text("SHIRTS")
                                .font(.custom("Helvetica Neue", size: 24))
                                .foregroundColor(Color.accentColor)
                        }
                        VStack {
                            Text("3")
                                .font(.custom("Helvetica Neue Bold", size: 24))
                                .foregroundColor(Color.accentColor)
                            Text("PANTS")
                                .font(.custom("Helvetica Neue", size: 24))
                                .foregroundColor(Color.accentColor)
                        }
                        VStack {
                            Text("1")
                                .font(.custom("Helvetica Neue Bold", size: 24))
                                .foregroundColor(Color.accentColor)
                            Text("JACKETS")
                                .font(.custom("Helvetica Neue", size: 24))
                                .foregroundColor(Color.accentColor)
                        }
                    }
                }
                
                Text(" 20 miles reward per 1kg reductions.")
                    .font(.custom("Helvetica Neue", size: 16))
                    .foregroundColor(Color.accentColor)

            }
        }
    }
}

struct PackView_Previews: PreviewProvider {
    static var previews: some View {
        PackView()
    }
}
