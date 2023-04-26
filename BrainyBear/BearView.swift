//
//  BearView.swift
//  BrainyBear
//
//  Created by iosdev on 26.4.2023.
//

import SwiftUI
import SceneKit
import UIKit
import QuartzCore
struct SceneView: UIViewRepresentable {
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> SCNView {
        let view = SCNView(frame: .zero)
        let scene = SCNScene(named: "Brian.usdc")!
        view.allowsCameraControl = true
        view.autoenablesDefaultLighting  = true
        scene.background.contents = UIImage(named: "Image")
        view.scene = scene
        return view
    }
}
