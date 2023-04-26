//
//  SpeechRecognition.swift
//  BrainyBear
//
//  Created by Tushar Nafisul on 23.4.2023.
//

import SwiftUI
import Speech
struct SpeechRecognition: View {
    
        @State private var isRecording = false
        @State private var recognizedText = ""
        @State private var speechRecognizer = SFSpeechRecognizer()
        @State private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
        @State private var recognitionTask: SFSpeechRecognitionTask?
        @State private var audioEngine = AVAudioEngine()
        @State private var currentScreen = "Voice recognition"
            
    let voiceCommands = [
           "Go to home screen": AnyView(ContentView()),
           "Go to settings": AnyView(MathGameView()),
           
       ]
       
        var body: some View {
            VStack {
                Text("Recognized Text: \(recognizedText)")
                    .padding()
                Text("Current screen: \(currentScreen)")
                Button(action: {
                    startRecording()
                }) {
                    Text("Start Recording")
                }
                .padding()
                Button(action: {
                    stopRecording()
                }) {
                    Text("Stop Recording")
                }
                .padding()
                
                Button(action: {
                                reset()
                            }) {
                                Text("Reset")
                                    .padding()
                            }
            }
            
        }
        
         func reset() {
            recognizedText = ""
        }
        func startRecording() {
            _ = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
            recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
            guard let recognitionRequest = recognitionRequest else { fatalError("Unable to create recognition request") }
            recognitionRequest.shouldReportPartialResults = true

            
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
                try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
            } catch {
                fatalError("Audio session setup failed: \(error)")
            }
            let inputNode = audioEngine.inputNode
            let recordingFormat = inputNode.outputFormat(forBus: 0)

           
            inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
                recognitionRequest.append(buffer)
            }
            audioEngine.prepare()
            do {
                try audioEngine.start()
            } catch {
                fatalError("Audio engine failed to start: \(error)")
            }
            recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest) { result, error in
                if let result = result {
                    let recognizedString = result.bestTranscription.formattedString
                    recognizedText = recognizedString
                    if recognizedString.lowercased().contains("math") {
                        NavigationLink(destination: MathGameView()){
                           }
                    } else if recognizedString.lowercased().contains("drawing") {
                        NavigationLink(destination: CanvasView()){
                            }
                    } else if recognizedString.lowercased().contains("playground") {
                        NavigationLink(destination: PlaygroundView()){
                            }
                    }
                } else if let error = error {
                    print("Speech recognition task error: \(error)")
                }
            }
            isRecording = true
        }

        func stopRecording() {
           
            audioEngine.stop()
            recognitionRequest?.endAudio()
            recognitionTask?.cancel()
            isRecording = false
        }
    }


struct SpeechRecognition_Previews: PreviewProvider {
    static var previews: some View {
        SpeechRecognition()
    }
}
