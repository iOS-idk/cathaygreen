//
//  EatView.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 14/11/2022.
//

import SwiftUI

struct EatView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State private var selected = 1
    
    var body: some View {
        VStack {
            PageHeadingView(name: "Eat Greener")
            
            Text("Select you meal")
                .font(.custom("Helvetica Neue Bold", size: 16))
                .foregroundColor(Color.accentColor)
            
            RadioButtonGroups { selected in
                print("Selected: \(selected)")
            }
            .padding([.leading, .trailing])
            
            nextButton

            Image("co2")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            Text("10 miles reward by choosing greener food.")
                .font(.custom("Helvetica Neue", size: 16))
                .foregroundColor(Color.accentColor)
        }
    }
    
    private var nextButton: some View {
        Button {
            viewRouter.currentPage = .eatFood
        } label: {
            HStack(alignment: .center, spacing: 10) {
                Text("Next")
                    .font(.custom("Helvetica Neue Bold", size: 24))
                    .foregroundColor(.white)
                    .frame(maxWidth:.infinity)
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.all, 10)
        }
        .padding([.leading, .trailing], 40)
        .buttonStyle(.borderedProminent)
    }

}

struct EatView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView {
            EatView().environmentObject(ViewRouter())
        }
    }
}
