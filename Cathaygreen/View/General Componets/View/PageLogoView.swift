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
        HStack {
            Spacer()
            Image("hotel")
                .resizable()
            Spacer()
        }
    }
}

struct PageLogo_Previews: PreviewProvider {
    static var previews: some View {
        PageLogoView().environmentObject(ViewRouter())
    }
}
