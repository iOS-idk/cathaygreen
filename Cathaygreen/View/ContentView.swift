//
//  ContentView.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 14/11/2022.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        BackgroundView {
            switch viewRouter.currentPage {
            case .home: HomeView()
            case .pack: PackView()
            case .eat: EatView()
            case .eatFood: EatFoodView()
            case .drink: DrinkView()
            case .shop: ShopView()
            case .stay: StayView()
            case .explore: ExploreView()
            }
            MenuBottomSheet()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
    }
}