//
//  ViewRouter.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 17/11/2022.
//

import SwiftUI

enum Page: String {
    case home = "home"
    case pack = "pack"
    case eat, eatFood = "Eat"
    case drink = "drink"
    case shop = "shop"
    case stay = "stay"
    case explore = "explore"
}

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .home
    
    @ViewBuilder
    func currentView() -> some View {
        switch currentPage {
        case .home: HomeView()
        case .pack: PackView()
        case .eat: EatView()
        case .eatFood: EatFoodView()
        case .drink: DrinkView()
        case .shop: ShopView()
        case .stay: StayView()
        case .explore: ExploreView()
        }
    }
    
}
