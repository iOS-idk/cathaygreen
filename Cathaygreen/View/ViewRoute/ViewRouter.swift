//
//  ViewRouter.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 17/11/2022.
//

import SwiftUI

enum Page: String {
    case home = "Home"
    case pack = "Pack"
    case eat = "Eat"
    case drink = "Drink"
    case shop = "Shop"
    case stay = "Stay"
    case explore = "Explore"
}

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .home
    
}
