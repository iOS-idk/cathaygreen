//
//  EatFoodView.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 18/11/2022.
//

import SwiftUI

struct EatFoodView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var api: API
    
    var body: some View {
        VStack {
            PageHeadingView(name: "Eat Greener")
            
            Text("Suggestions")
                .font(.custom("Helvetica Neue Bold", size: 16))
                .foregroundColor(Color.accentColor)
            
            VStack {
                ForEach(api.eatFood, id: \.self) { eatFood in
                    EatFoodRow(eatFood: eatFood)
                        .padding([.leading, .trailing], 60)
                }
            }
            
            VStack {
                Text("10 miles reward by choosing greener food.")
                    .font(.custom("Helvetica Neue", size: 14))
                    .foregroundColor(Color.accentColor)
            }
        }
        .task {
            try? await api.fetchEatFood()
        }
    }
}

struct EatFoodView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView {
            EatFoodView()
                .environmentObject(ViewRouter())
                .environmentObject(API())
        }
    }
}
