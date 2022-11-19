//
//  PageLogo.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 17/11/2022.
//

import SwiftUI

struct PageLogoView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        if viewRouter.currentPage == .home {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            
        } else {
            HStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140)
                
                Spacer()
                
                Image(viewRouter.currentPage.rawValue.lowercased())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
            }
        }
    }
}

struct PageLogo_Previews: PreviewProvider {
    static var previews: some View {
        PageLogoView()
            .environmentObject(ViewRouter())
    }
}
