//
//  ContentView.swift
//  HelloWorld
//
//  Created by Robert Hoang on 11/02/2023.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    var body: some View {
        VStack {
//            Text("Hello, world!")
//                .padding()
//                .foregroundColor(Color.indigo)
//                .font(.system(size: 40))
//
//            Text("I'm Robert Hoang")
////                .padding()
//                .foregroundColor(Color.red)
//                .font(.system(size: 30))
////            Spacer()
            Button {
                speak(text: "Hellow world!")
            } label: {
                Text("Hit me!")
//                    .foregroundColor(.white)
                    .bold()
                    .font(.system(.title, design: .rounded))
            }
            .padding()
            .foregroundColor(.white)
            .background(.indigo)
            .cornerRadius(20)
            Button {
                speak(text: "Hi, my name is Robert!")
            } label: {
                Text("Hit me!")
//                    .foregroundColor(.white)
                    .bold()
                    .font(.system(.title, design: .rounded))
            }
            .padding()
            .foregroundColor(.white)
            .background(.yellow)
            .cornerRadius(20)
            Button {
                speak(text: "Hello universe!")
                
            } label: {
                Text("Hit me!")
//                    .foregroundColor(.white)
                    .bold()
                    .font(.system(.title, design: .rounded))
            }
            .padding()
            .foregroundColor(.white)
            .background(.red)
            .cornerRadius(20)

        }
        
    }
    
    func speak(text: String) -> Void {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
