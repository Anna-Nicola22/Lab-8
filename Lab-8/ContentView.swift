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
    @State var pressed = false
    var hitCounter: Int = 0
    var body: some View {
        
        VStack{
            ARViewContainer(boxAnchor: $boxAnchor, buttonPressed: $buttonPressed).edgesIgnoringSafeArea(.all)
            
            if(pressed == false){
                Button("play", action: {
                    pressed = true
                    boxAnchor.notifications.startNotification.post()
                })
            }else{
                //TextField(hitCounter, text: <#Binding<String>#>)
                //self.boxAnchor.actions.planeWasHit.onAction = {}
                Text(String(hitCounter))
            }
            
            
        }
        
    }
}

struct ARViewContainer: UIViewRepresentable {
    var boxAnchor: Binding<Experience.Box>
    var buttonPressed : Binding<Bool>
    let arView = ARView(frame: .zero)
    @State var hitCounter: Int = 0
    
    func makeUIView(context: Context) -> ARView {
        
        //let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        
        //let boxAnchor = try! Experience.loadBox()
        
        //self.boxAnchor.wrappedValue.actions.planeWasHit.onAction = { entity in print("Plane was Hit") }
//        self.boxAnchor.wrappedValue.actions.planeWasHit.onAction = { entity in ContentView(hitCounter: $hitCounter += 1) }
        
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
