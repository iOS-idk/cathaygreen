//
//  ShopListRow.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 16/11/2022.
//

import SwiftUI

struct ShopListRow: View {
    let shop: Shop
    
    var body: some View {
        HStack(spacing: 10) {
            GeometryReader { geo in
                Image(shop.name.lowercased())
                    .resizable()
                    .cornerRadius(8)
            }
            .frame(maxWidth: 130, maxHeight: 200)
            .scaledToFill()
            
            VStack(alignment: .leading) {
                HStack {
                    Image("co2")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("15 Miles")
                        .font(.custom("Helvetica Neue", size: 16))
                        .foregroundColor(Color.accentColor)
                }
                Text(shop.name)
                    .font(.custom("Helvetica Neue Bold", size: 18))
                    .foregroundColor(Color.accentColor)
                Text(shop.description)
                    .font(.custom("Helvetica Neue", size: 16))
                    .foregroundColor(Color.accentColor)
                
                HStack {
                    Spacer()
                    Text("HKD \(shop.price)")
                        .font(.custom("Helvetica Neue Bold", size: 16))
                        .foregroundColor(Color.accentColor)
                }
                
                RoundButton(title: "Buy", cornerRadius: 16)
            }
            
        }

    }
}

struct ShopListRow_Previews: PreviewProvider {
    static var previews: some View {
        ShopListRow(shop: Shop(name: "Ecological Compound", description: "Sisley", price: 1532, mile: 15))
    }
}
