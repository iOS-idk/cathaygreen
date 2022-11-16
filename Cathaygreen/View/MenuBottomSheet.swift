//
//  MenuBottomSheet.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 16/11/2022.
//

import SwiftUI

struct MenuBottomSheet: View {
    @State private var showingCredits = true

    var body: some View {
        Button("Show Credits") {
            showingCredits.toggle()
        }
        .sheet(isPresented: $showingCredits) {
            Text("Explorer more")
//                .presentationDetents([.fraction(0.1), .large])
                Divider()
            
            VStack {
                
            }
            
        }
    }
}

struct MenuBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        MenuBottomSheet()
    }
}
