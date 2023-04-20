//
//  ShopView.swift
//  BrainyBear
//
//  Created by iosdev on 20.4.2023.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
}

struct ShopView: View {
    @State private var items = [Item]()
    @State private var showingAddItemView = false
    
    @State private var coins: Int?
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Reward store")
                        .fontWeight(Font.headline)
                        .padding()
                    Spacer()
                    Text("💰 \(coins ?? 0)")
                        .onAppear(perform: {
                            coins = DataController.shared.fetchScore()
                        })
                        .foregroundColor(Color.bbBlack)
                        .padding()
                        .background(Color.bbLilac, in: Capsule())
                        .shadow(radius: 5)
                        .font(.custom("Verdana", fixedSize: 25))
                        .padding()
                }
                List {
                    ForEach(items) { item in
                        ItemRow(item: item) {
                            deleteItem(item)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                Button(action: {
                    showingAddItemView = true
                }) {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showingAddItemView) {
                    AddItemView(addItem: addItem)
                }
            }
        }
    }
    
    func addItem(item: Item) {
        items.append(item)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func deleteItem(_ item: Item) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items.remove(at: index)
        }
    }
}

struct ItemRow: View {
    let item: Item
    let onDelete: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price, specifier: "%.2f")")
                    .font(.subheadline)
            }
            Spacer()
            Button(action: onDelete) {
                Image(systemName: "dollarsign.circle")
                    .foregroundColor(.green)
                    .padding()
            }
        }
    }
}

struct AddItemView: View {
    @State private var itemName = ""
    @State private var itemPrice = ""
    @Environment(\.presentationMode) var presentationMode
    let addItem: (Item) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Item Name", text: $itemName)
                    TextField("Price", text: $itemPrice)
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    Button(action: saveItem) {
                        Text("Save")
                    }
                }
            }
            .navigationBarTitle("Add Item")
        }
    }
    
    func saveItem() {
        guard let price = Double(itemPrice) else { return }
        let newItem = Item(name: itemName, price: price)
        addItem(newItem)
        presentationMode.wrappedValue.dismiss()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
