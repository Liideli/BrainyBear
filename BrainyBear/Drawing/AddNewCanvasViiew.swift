//
//  AddNewCanvasViiew.swift
//  BrainyBear
//
//  Created by iosdev on 14.4.2023.
//

import SwiftUI
/**
struct AddNewCanvasViiew: View {
    
    @Environment (\.managedObjectContext) var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State private var canvasTitle = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Canvas Title", text: $canvasTitle)
                }
            }
            .navigationTitle(Text("Add new canvas"))
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
            }), trailing: Button(action: {
                if !canvasTitle.isEmpty {
                    let drawing = Drawing(context: viewContext)
                    drawing.title = canvasTitle
                    drawing.id = UUID()
                    self.presentationMode.wrappedValue.dismiss()
                }
            }, label: {
                Text("Save")
            }))
        }
    }
}

struct AddNewCanvasViiew_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCanvasViiew()
    }
}*/
