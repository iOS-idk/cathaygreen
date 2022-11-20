//
//  API.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 14/11/2022.
//

import Foundation
import Alamofire

@MainActor
class API: ObservableObject {
    
    private let baseURL = "http://13.214.219.65:3000/api"
    
    @Published var shop = [Shop]()
    @Published var stay = [StayExplore]()
    @Published var explore = [StayExplore]()
    @Published var eatFood = [Eat]()
    
    func fetchAllShop() async throws {
        let localData = [
            Shop(name: "Ecological Compound", description: "Sisley", price: 1532, mile: 15),
            Shop(name: "PORTABLE POWER GENERATOR", description: "ECOBOXX", price: 1468, mile: 14),
        ]
        
        AF.request("\(baseURL)/shop", method: .get).responseDecodable(of: [Shop].self) { res in
            debugPrint(res)
            self.shop = res.value ?? localData
        }
    }
    
    func fetchAllStay() async throws {
        let localData = [
            StayExplore(name: "Hotel ICON", description: "CarbonCare Label", mile: 30),
            StayExplore(name: "New World", description: "Awards for Environmental Excellence", mile: 30),
        ]
        
        AF.request("\(baseURL)/stay", method: .get).responseDecodable(of: [StayExplore].self) { res in
            debugPrint(res)
            self.stay = res.value ?? localData
        }
        
    }
    
    func fetchAllExplore() async throws {
        let localData = [
            StayExplore(name: "Electric Car Rental", description: "Reduce car CO2 emissions", mile: 30),
            StayExplore(name: "ECO Day Trips", description: "Mindful travel experience", mile: 20),
        ]
        
        AF.request("\(baseURL)/explore", method: .get).responseDecodable(of: [StayExplore].self) { res in
            debugPrint(res)
            self.explore = res.value ?? localData
        }
    }
    
    func fetchEatFood() async throws {
        let localData = [
            Eat(name: "Vegetarian Lacto-Ovo Meal"),
            Eat(name: "Vegetarian Raw Meal")
        ]
        
        AF.request("\(baseURL)/eat", method: .get).responseDecodable(of: [Eat].self) { res in
            debugPrint(res)
            self.eatFood = res.value ?? localData
        }
    }
    
}
