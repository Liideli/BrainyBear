//
//  AddNewCanvasView.swift
//  BrainyBear
//
//  Created by iosdev on 22.4.2023.
//

import SwiftUI

struct AddNewCanvasView: View {
    
    @Environment (\.managedObjectContext) var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State private var canvasTitle = ""
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("addDraw-background")
                    .resizable()
                    .ignoresSafeArea()
                Form{
                    Section{
                        TextField("Name your masterpiece", text: $canvasTitle)
                    }
                }
                .navigationTitle(Text("New Masterpiece"))
                .navigationBarItems(leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                }), trailing: Button(action: {
                    if !canvasTitle.isEmpty {
                        let drawing = Drawing(context: viewContext)
                        drawing.title = canvasTitle
                        drawing.id = UUID()
                        do {
                            try viewContext.save()
                        }
                        catch {
                            print(error)
                        }
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }, label: {
                    Text("Save")
                }))
            }
            }.scrollContentBackground(.hidden)
        }
}

struct AddNewCanvasView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCanvasView()
    }
}
