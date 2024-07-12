//
//  XylophoneViewModel.swift
//  FZXylophone
//
//  Created by Fouad Mohammed Rafique Anwar on 12/07/24.
//

import Foundation
import AVFoundation

class XylophoneViewModel: ObservableObject {
    @Published var fileNames: [String] = [ "A", "B", "C", "D", "E", "F", "G" ]

    private var player: AVAudioPlayer?
    
    func playSound(fileName: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "wav") {
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
                player?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
}
