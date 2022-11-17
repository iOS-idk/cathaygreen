//
//  MenuBottomSheet.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 16/11/2022.
//

import SwiftUI
import BottomSheet

struct MenuBottomSheet: View {
    
    @State var bottomSheetPosition: BottomSheetPosition = .relative(0.4)
    
    @State private var showingCredits = true
    
    private var isLarge: Bool {
        return selectedDetent == .large ? true : false
    }
    
    private var backgroundColor: Color {
        return isLarge ? .white : .accentColor
    }
    
    @State var selectedDetent: PresentationDetent = .fraction(0.1)

    var body: some View {
        ZStack {
            
        }
        .bottomSheet(bottomSheetPosition: $bottomSheetPosition, switchablePositions: [.dynamic]) {
            Text("Hello")
        }
        .dragIndicatorColor(.accentColor)
        .padding([.leading, .trailing], 20)
    }
}

struct MenuBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        MenuBottomSheet()
    }
}
