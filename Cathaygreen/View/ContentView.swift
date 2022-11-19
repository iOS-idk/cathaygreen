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
            VStack {
                PageLogoView()
                    .padding([.leading, .trailing], 10)

                viewRouter.currentView()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            }
            
            MenuBottomSheet()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewRouter())
            .environmentObject(BottomSheetLevel())
    }
}
