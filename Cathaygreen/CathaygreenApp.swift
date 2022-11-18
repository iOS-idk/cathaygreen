//
//  CathaygreenApp.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 14/11/2022.
//

import SwiftUI

@main
struct CathaygreenApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    @StateObject var api = API()
    @StateObject var bottomSheetLevel = BottomSheetLevel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewRouter)
                .environmentObject(api)
                .environmentObject(bottomSheetLevel)
        }
    }
}
