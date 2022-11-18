//
//  ShopView.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 14/11/2022.
//

import SwiftUI

struct ShopView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var api: API
    
    var body: some View {
        VStack {
            PageHeadingView(name: "SHOP GREENER")
            
            VStack {
                ForEach(api.shop, id: \.self) { shop in
                    ShopListRow(shop: shop)
                        .padding([.leading, .trailing], 40)
                }
            }

        }
        .task {
            try? await api.fetchAllShop()
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            ShopView()
                .environmentObject(ViewRouter())
                .environmentObject(API())
        }
    }
}
