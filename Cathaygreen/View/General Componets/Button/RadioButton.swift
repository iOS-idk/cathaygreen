//
//  RadioButton.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 16/11/2022.
//

import SwiftUI

struct RadioButton: View {
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat
    let isMarked:Bool
    let callback: (String)->()
    
    init(
        id: String,
        label:String,
        size: CGFloat = 20,
        color: Color = Color.black,
        textSize: CGFloat = 24,
        isMarked: Bool = false,
        callback: @escaping (String)->()
        ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.isMarked = isMarked
        self.callback = callback
    }
    
    var body: some View {
        
        HStack {
            
            Spacer(minLength: 20)
            
            Button {
                self.callback(self.id)
            } label: {
                HStack(alignment: .center, spacing: 10) {
                    Image(systemName: self.isMarked ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(.accentColor)
                        .frame(width: self.size, height: self.size)
                    
                    Text(label)
                        .font(.custom("Helvetica Neue Bold", size: textSize))
                        .foregroundColor(Color.accentColor)
                        .frame(maxWidth:.infinity)
                    Spacer()
                }.foregroundColor(self.color)
            }
            .foregroundColor(Color.white)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.accentColor, lineWidth: 2)
            )
            
            Spacer(minLength: 20)
            
        }
        .frame(maxWidth:.infinity)

    }
}
