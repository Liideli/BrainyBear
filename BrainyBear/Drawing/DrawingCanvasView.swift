//
//  DrawingCanvasView.swift
//  BrainyBear
//
//  Created by iosdev on 23.4.2023.
//

import SwiftUI
import PencilKit
import CoreData

struct DrawingCanvasView: UIViewControllerRepresentable {
    @Environment(\.managedObjectContext) private var viewContext
    
    func updateUIViewController(_ uiViewController: DrawingCanvasViewController, context: Context) {
        uiViewController.drawingData = data
    }
    typealias UIViewControllerType = DrawingCanvasViewController
    
    var data: Data
    var id: UUID
    
    func makeUIViewController(context: Context) -> DrawingCanvasViewController {
        let viewController = DrawingCanvasViewController()
        viewController.drawingData = data
        viewController.drawingChanged = {data in
            let request: NSFetchRequest<Drawing> = Drawing.fetchRequest()
            let predicate = NSPredicate(format: "id == %@", id as CVarArg)
            request.predicate = predicate
            do {
                let result = try viewContext.fetch(request)
                let obj = result.first
                obj?.setValue(data, forKey: "canvasData")
                do{
                    try viewContext.save()
                }
                catch {
                    print(error)
                }
            }
            catch {
                print(error)
            }
        }
        return viewController
    }
}
