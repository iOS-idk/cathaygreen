//
//  MenuGridRow.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 17/11/2022.
//

import SwiftUI

struct MenuGridItemButton: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    let titleType: Page
    
    var body: some View {
        Button {
            viewRouter.currentPage = titleType
        } label: {
            VStack {
                Image(titleType.rawValue.lowercased())
                    .resizable()
                    .frame(width: 54, height: 54)
                    .foregroundColor(.green)

                Text(titleType.rawValue.capitalized)
                    .font(.custom("Helvetica Neue Bold", size: 20))
                    .foregroundColor(Color.accentColor)
                    .offset(y: 10)
                  
            }
            .padding()
            .frame(minWidth: 120)
        }
        .tint(.white)
        .controlSize(.large)
        .buttonStyle(.borderedProminent)
    }
}

struct MenuGridRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            MenuGridItemButton(titleType: .pack)
        }
    }
}
