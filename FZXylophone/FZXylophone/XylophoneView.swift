//
//  XylophoneView.swift
//  FZXylophone
//
//  Created by Fouad Mohammed Rafique Anwar on 12/07/24.
//

import SwiftUI

struct XylophoneView: View {
    @StateObject private var viewModel = XylophoneViewModel()
    @State private var showBubble = Array(repeating: false, count: 7)
    
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .indigo, .purple]
    let widths: [CGFloat] = [300, 280, 260, 240, 220, 200, 180]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(viewModel.fileNames.indices, id: \.self) { index in
                NoteButton(
                    fileName: viewModel.fileNames[index],
                    color: colors[index],
                    width: widths[index],
                    action: { viewModel.playSound(fileName: viewModel.fileNames[index]) },
                    showBubble: $showBubble[index]
                )
                .overlay(
                    Circle()
                        .fill(colors[index].opacity(0.5))
                        .frame(width: showBubble[index] ? 80 : 0, height: showBubble[index] ? 80 : 0)
                        .animation(.easeInOut, value: showBubble[index])
                )
            }
        }
        .padding()
    }
}

extension Color {
    static var random: Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

#Preview {
    XylophoneView()
}
