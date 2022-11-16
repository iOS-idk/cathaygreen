//
//  HomeView.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 14/11/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            ContentView()
            VStack {
                MileCircle(mile: 50)

                Text("Next Flight")
                    .font(.custom("Helvetica Neue Bold", size: 16))
                    .foregroundColor(Color.accentColor)
                
                HStack {
                    RoundButton(title: "HKG")
                    
                    
                    
                    RoundButton(title: "LHR")
                }
                
                Text("9 hours")
                    .font(.custom("Helvetica Neue Bold", size: 16))
                    .foregroundColor(Color.accentColor)
        
                Text("Go Green Advices")
                    .font(.custom("Helvetica Neue Bold", size: 16))
                    .foregroundColor(Color.accentColor)
                
                ImageTextRect(title: "Pack Greener", description: "Reduce fossil fuel with lighter belongings.")
                
                ImageTextRect(title: "EAT", description: "See greener food suggestions.")
            }
            .padding(.top, 30)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
