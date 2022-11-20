//
//  EatFoodRow.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 18/11/2022.
//

import SwiftUI

struct EatFoodRow: View {
    let eatFood: Eat
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image(eatFood.name.lowercased())
                    .resizable()
                    .cornerRadius(8)
            }
            .frame(maxHeight: 160)
            .scaledToFill()
            
            Text(eatFood.name)
                .font(.custom("Helvetica Neue Bold", size: 20))
                .foregroundColor(Color.accentColor)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct EatFoodRow_Previews: PreviewProvider {
    static var previews: some View {
        EatFoodRow(eatFood: Eat(name: "Vegetarian Lacto-Ovo Meal"))
    }
}
