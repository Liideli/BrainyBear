//
//  CanvasView.swift
//  BrainyBear
//
//  Created by iosdev on 14.4.2023.
//

import SwiftUI
import PencilKit

struct CanvasView: View {
    var body: some View {
            
            Home()
        }
}

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView()
    }
}

struct Home: View {
    // Localized string key
    let draw:LocalizedStringKey = "draw"
    let colorPick:LocalizedStringKey = "colorPick"
    let pencil:LocalizedStringKey = "pencil"
    let pen:LocalizedStringKey = "pen"
    let marker:LocalizedStringKey = "marker"
    let pickColor:LocalizedStringKey = "pickColor"
    
    @State var canvas = PKCanvasView()
    @State var isdraw = true
    @State var color: Color = .black
    @State var type: PKInkingTool.InkType = .pencil
    @State var colorPicker = false
    
    // default is pen
    
    var body: some View {
        
        NavigationView {
            
            // Drawing View......
            
            DrawingView(canvas: $canvas, isdraw: $isdraw, type: $type, color: $color)
                .navigationTitle(draw)
                .font(.system(size: 35))
                .navigationBarTitleDisplayMode(.inline)
                .foregroundColor(Color.purple)
                .navigationBarItems(leading: Button(action: {
                    
                    // Saving Image.......
                    
                    saveImage()
                    
                }, label: {
                    Image(systemName: "square.and.arrow.down.fill")
                        .font(.title)
                        .foregroundColor(Color.orange)
                }), trailing: HStack(spacing: 15) {
                    
                    Button(action: {
                        
                        // erase tool
                        
                        isdraw = false
                        
                        isdraw.toggle()
                        
                    }) {
                        
                        Image(systemName: "pencil.slash")
                            .font(.title)
                            .foregroundColor(Color.orange)
                    }
                    
                    Menu {
                        
                        // ColorPicker
                        
                        ColorPicker(selection: $color) {
                            
                            Button(action: {
                                
                                colorPicker.toggle()
                            }) {
                                Label {
                                    
                                    Text(colorPick)
                                } icon: {
                                    
                                    Image(systemName: "eyedropper.full")
                                        .foregroundColor(Color.orange)
                                }
                                
                            }
                            
                        }
                        
                        
                        Button(action: {
                            
                            // changing type
                            
                            isdraw = true
                            type = .pencil
                        }) {
                            
                            Label {
                                
                                Text(pencil)
                            } icon: {
                                
                                Image(systemName: "pencil")
                            }
                            
                        }
                        
                        Button(action: {
                            isdraw = true
                            type = .pen
                        }) {
                            
                            Label {
                                
                                Text(pen)
                            } icon: {
                                
                                Image(systemName: "pencil.tip")
                            }
                            
                        }
                        Button(action: {
                            isdraw = true
                            type = .marker
                        }) {
                            
                            Label {
                                
                                Text(marker)
                            } icon: {
                                
                                Image(systemName: "highlighter")
                            }
                            
                        }
                        
                        
                    } label: {
                        Image(systemName: "menubar.dock.rectangle")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(Color.orange)
                    }
                    
                    
                })
                .sheet(isPresented: $colorPicker) {
                    
                   ColorPicker(pickColor, selection: $color)
                    .padding()
                }
            
            
        }
    }
    
    func saveImage() {
        
        // getting image from Canvas
        
        let image = canvas.drawing.image(from: canvas.drawing.bounds, scale: 1)
        
        // saving to album
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        
    }
}

struct DrawingView: UIViewRepresentable {
    // to capture drawings for saving into albums
    @Binding var canvas: PKCanvasView
    @Binding var isdraw: Bool
    @Binding var type: PKInkingTool.InkType
    @Binding var color: Color
    
    
    // Updating inktype
    
     var ink : PKInkingTool {
        
        PKInkingTool(type, color: UIColor(color))
    }
    
    let eraser = PKEraserTool(.bitmap)
    
    func makeUIView(context: Context) -> PKCanvasView {
        
        canvas.drawingPolicy = .anyInput
        canvas.tool = isdraw ? ink : eraser
        
        return canvas
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        // updating the tool whenever the view updates
        
        uiView.tool = isdraw ? ink : eraser
        
    }
}


