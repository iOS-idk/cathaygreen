//
//  ExploreView.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 14/11/2022.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var api: API
    
    var body: some View {
        VStack {
            PageHeadingView(name: "EXPLORE GREENER")
            
            ScrollView {
                ForEach(api.explore, id: \.self) { explore in
                    StayExplortRow(stayExplore: explore)
                        .padding([.leading, .trailing], 40)
                }
            }

        }
        .task {
            try? await api.fetchAllExplore()
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView {
            ExploreView()
                .environmentObject(ViewRouter())
                .environmentObject(API())
        }
    }
}
