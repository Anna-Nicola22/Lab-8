//
//  ContentView.swift
//  Lab-8
//
//  Created by ICS 224 on 2021-03-22.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @State var buttonPressed = false
    @State var boxAnchor = try! Experience.loadBox()
    
    var body: some View {
        
        VStack{
            ARViewContainer(boxAnchor: $boxAnchor, buttonPressed: $buttonPressed).edgesIgnoringSafeArea(.all)
            
            Button("play", action: {
                boxAnchor.notifications.startNotification.post()
            })
            
            
        }
        
    }
}

struct ARViewContainer: UIViewRepresentable {
    var boxAnchor: Binding<Experience.Box>
    var buttonPressed : Binding<Bool>
    let arView = ARView(frame: .zero)
    
    func makeUIView(context: Context) -> ARView {
        
        //let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        
        //let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        
        arView.scene.anchors.append(boxAnchor.wrappedValue)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
