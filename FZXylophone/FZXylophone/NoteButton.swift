//
//  NoteButton.swift
//  FZXylophone
//
//  Created by Fouad Mohammed Rafique Anwar on 12/07/24.
//

import SwiftUI

struct NoteButton: View {
    let fileName: String
    let color: Color
    let width: CGFloat
    let action: () -> Void
    @Binding var showBubble: Bool

    var body: some View {
        Button(action: {
            action()
            withAnimation(.easeInOut(duration: 0.03)) {
                showBubble = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeInOut(duration: 0.2)) {
                    showBubble = false
                }
            }
        }) {
            Text(fileName)
                .font(.largeTitle)
                .frame(width: width, height: 60)
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 10)
        }
    }
}

#Preview {
    NoteButton(fileName: "F", color: .red, width: 100, action: {}, showBubble: .constant(true))
}
