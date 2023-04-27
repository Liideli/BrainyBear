//
//  AddNewCanvasView.swift
//  BrainyBear
//
//  Created by iosdev on 22.4.2023.
//

import SwiftUI

struct AddNewCanvasView: View {
    
    // Localized string keys
    let titleCanvas:LocalizedStringKey = "titleCanvas"
    let addNewCanvas:LocalizedStringKey = "addNewCanvas"
    let save:LocalizedStringKey = "save"
    
    @Environment (\.managedObjectContext) var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State private var canvasTitle = ""
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField(titleCanvas, text: $canvasTitle)
                }
            }
            .navigationTitle(Text(addNewCanvas))
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
                Text(save)
            }))
        }
    }
}

struct AddNewCanvasView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCanvasView()
    }
}
