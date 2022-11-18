//
//  API.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 14/11/2022.
//

import Foundation

@MainActor
class API: ObservableObject {
    
    @Published var shop = [Shop]()
    @Published var stay = [StayExplore]()
    @Published var explore = [StayExplore]()
    
    func fetchAllShop() async throws {
        shop = [
            Shop(name: "Ecological Compound", description: "Sisley", price: 1532, mile: 15),
            Shop(name: "PORTABLE POWER GENERATOR", description: "ECOBOXX", price: 1468, mile: 14),
        ]
    }
    
    func fetchAllStay() async throws {
        stay = [
            StayExplore(name: "Hotel ICON", description: "CarbonCare Label", mile: 30),
            StayExplore(name: "New World", description: "Awards for Environmental Excellence", mile: 30),
        ]
    }
    
    func fetchAllExplore() async throws {
        explore = [
            StayExplore(name: "Electric Car Rental", description: "Reduce car CO2 emissions", mile: 30),
            StayExplore(name: "ECO Day Trips", description: "Mindful travel experience", mile: 20),
        ]
    }
    
}
