//
//  CanvasView.swift
//  BrainyBear
//
//  Created by iosdev on 14.4.2023.
//

import SwiftUI
import CoreData

struct CanvasView: View {
    
    // Localized string keys
    let addCanvas:LocalizedStringKey = "addCanvas"
    let drawing:LocalizedStringKey = "drawing"
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Drawing.entity(), sortDescriptors: []) var drawings: FetchedResults<Drawing>
    
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("draw-background")
                    .resizable()
                    .ignoresSafeArea()
                    List {
                        ForEach(drawings) {drawing in
                            NavigationLink(destination: DrawingView(id: drawing.id, data: drawing.canvasData, title: drawing.title), label:{
                                Text(drawing.title ?? "Untitled")
                            })
                        }
                        .onDelete(perform: deleteItem)
                    
                    Button(action: {
                        self.showSheet.toggle()
                    }, label: {
                        HStack{
                            Image(systemName: "plus")
                            Text(addCanvas)
                        }
                    })
                    .foregroundColor(.orange)
                    .sheet(isPresented: $showSheet, content: {
                        AddNewCanvasView().environment(\.managedObjectContext, viewContext)
                    })
                }
            }
        }
        .scrollContentBackground(.hidden)
    }
    
    func deleteItem(at offset: IndexSet) {
        for index in offset {
            let itemToDelete = drawings[index]
            viewContext.delete(itemToDelete)
            do {
                try viewContext.save()
            }
            catch {
                print(error)
            }
        }
    }
}



struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

