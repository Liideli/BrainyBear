//
//  ARView.swift
//  BrainyBear
//
//  Created by Roope Laine on 2.4.2023.
//

import SwiftUI
import RealityKit


struct AugmentedRealityView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {

        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Scale the object
        boxAnchor.scale = SIMD3<Float>(0.1, 0.1, 0.1)
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}

    
}

#if DEBUG
struct AugmentedRealityView_Previews : PreviewProvider {
    static var previews: some View {
        AugmentedRealityView()
    }
}
#endif
