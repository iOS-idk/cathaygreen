//
//  MenuBottomSheet.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 16/11/2022.
//

import SwiftUI

struct MenuBottomSheet: View {
    @State private var showingCredits = true
    
    @State var selectedDetent: PresentationDetent = .fraction(0.1)

    var body: some View {
        ZStack {
            
        }
        .sheet(isPresented: $showingCredits) {
            ZStack {
                Color.accentColor.edgesIgnoringSafeArea(.all)
                HStack {
                    Text("Explorer more")
                        .presentationDetents([.fraction(0.1), .large], selection: $selectedDetent)
                    
                    Button {
                        selectedDetent = .large
                    } label: {
                        Image(systemName: "arrow.up")
                            .padding()
                            .frame(width: 34, height: 34)
                            .foregroundColor(.accentColor)
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                    
                }
                Divider()
            }
        }

    }
}

struct MenuBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        MenuBottomSheet()
    }
}
