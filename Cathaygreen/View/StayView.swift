//
//  StayView.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 14/11/2022.
//

import SwiftUI

struct StayView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var api: API
    
    var body: some View {
        VStack {
            PageHeadingView(name: "STAY GREENER")
            
            ScrollView {
                ForEach(api.stay, id: \.self) { stay in
                    StayExplortRow(stayExplore: stay)
                        .padding([.leading, .trailing], 40)
                }
            }

        }
        .task {
            try? await api.fetchAllStay()
        }
    }
}

struct StayView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView {
            StayView()
                .environmentObject(ViewRouter())
                .environmentObject(API())
        }
    }
}
