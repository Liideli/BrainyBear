//
//  ShopView.swift
//  BrainyBear
//
//  Created by iosdev on 20.4.2023.
//

import SwiftUI
import PasscodeField

struct ShopItem: Identifiable {
    let id = UUID()
    let name: String
    let price: Int
}

struct ShopView: View {
    
    // Localized string keys
    let rewardStore:LocalizedStringKey = "rewardStore"
    let buyItem:LocalizedStringKey = "buyItem"
    let cancel:LocalizedStringKey = "cancel"
    let doYouWant:LocalizedStringKey = "doYouWant"
    let `for`:LocalizedStringKey = "for"
    let coinsAmount:LocalizedStringKey = "coinsAmount"
    let notEnough:LocalizedStringKey = "notEnough"
    let noRewardsToBuyYet:LocalizedStringKey = "noRewardsToBuyYet"
    let parentalPassword:LocalizedStringKey = "parentalPassword"
    let fourDigits:LocalizedStringKey = "fourDigits"
    let wrongPassword:LocalizedStringKey = "wrongPassword"
    let retry:LocalizedStringKey = "retry"
    let quit:LocalizedStringKey = "quit"
    
    @State private var items = [ShopItem]()
    @State private var showingAddItemView = false
    @State private var coins: Int?
    @State private var showingConfirmation = false
    @State private var showingPasscodeView = false
    @State private var isShowingAlert = false
    @State private var isPresentingPasscode = false

    var body: some View {
        NavigationView {
            Color.bbLightBrown
                .ignoresSafeArea()
                .overlay(
            VStack {
                HStack {
                    Text(rewardStore)
                        .font(.largeTitle)
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
                if items.count > 0 {
                    List {
                        ForEach(items) { item in
                            ItemRow(item: item) {
                                showingConfirmation = true
                            }
                            .confirmationDialog(buyItem, isPresented: $showingConfirmation) {
                                if (coins ?? 0 >= item.price) {
                                    Button(buyItem) { deleteItem(item) }
                                    Button(cancel, role: .cancel) { }
                                } else {
                                    Button(cancel, role: .cancel) { }
                                }
                            } message: {
                                if (coins ?? 0 >= item.price) {
                                    Text(doYouWant) + Text("\(item.name)") + Text(`for`) + Text("\(item.price) ") + Text(coinsAmount)

                                } else {
                                    Text(notEnough) + Text("\(item.name)")
                                }
                            }
                        }
                        .deleteDisabled(true)
                    }
                    .background(Color.bbLightBrown)
                    .scrollContentBackground(.hidden)
                } else {
                    Spacer()
                    Text(noRewardsToBuyYet)
                        .italic()
                    Spacer()
                }
                Button(action: {
                    showingPasscodeView = true
                }) {
                    Image(systemName: "plus")
                        .padding()
                        .font(.system(size: 35))
                        .background(Color.bbLilac)
                        .foregroundColor(Color.bbBlack)
                        .clipShape(Capsule())
                }
                .sheet(isPresented: $showingPasscodeView) {
                    let candidatePasscodes = ["1234", "0000"]
                    PasscodeField { digits, action in
                        if candidatePasscodes.contains(digits.concat) {
                            withAnimation {
                                showingPasscodeView = false
                                showingAddItemView = true
                            }
                            action(true)
                        } else {
                            withAnimation {
                                isShowingAlert = true
                            }
                            action(false)
                        }
                    } label: {
                        VStack(alignment: .center, spacing: 8) {
                            Text(parentalPassword)
                                .font(.title)
                                .foregroundColor(Color(.label))
                            
                            Text(fourDigits)
                                .font(.footnote)
                                .foregroundColor(Color(.secondaryLabel))
                        }
                    }
                    .alert("Wrong password!", isPresented: $isShowingAlert) {
                        VStack {
                            Button("Retry", role: .cancel) { }
                            Button("Quit", role: .destructive) {showingPasscodeView = false}
                        }
                    }
                }
                .sheet(isPresented: $showingAddItemView) {
                    AddItemView(addItem: addItem)
                }
            })
        }
    }
    
    func addItem(item: ShopItem) {
        items.append(item)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func deleteItem(_ item: ShopItem) {
        if (coins ?? 0 >= item.price) {
            if let index = items.firstIndex(where: { $0.id == item.id }) {
                coins = (coins ?? 0) - item.price
                DataController.shared.saveScore(coins!)
                items.remove(at: index)
            }
        }
    }
}

struct ItemRow: View {
    let item: ShopItem
    let onDelete: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
                    .font(.subheadline)
            }
            Spacer()
            Button(action: onDelete) {
                Image(systemName: "dollarsign.circle")
                    .font(.system(size: 35))
                    .foregroundColor(.green)
                    .padding()
            }
        }
    }
}

struct AddItemView: View {
    
    // Localized string keys
    let nameItem:LocalizedStringKey = "nameItem"
    let price:LocalizedStringKey = "price"
    let save:LocalizedStringKey = "save"
    let itemAdd:LocalizedStringKey = "itemAdd"
    
    @State private var itemName = ""
    @State private var itemPrice = ""
    @Environment(\.presentationMode) var presentationMode
    let addItem: (ShopItem) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField(nameItem, text: $itemName)
                    TextField(price, text: $itemPrice)
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    Button(action: saveItem) {
                        Text(save)
                    }
                }
            }
            .navigationBarTitle(itemAdd)
        }
    }
    
    func saveItem() {
        guard let price = Int(itemPrice) else { return }
        let newItem = ShopItem(name: itemName, price: price)
        addItem(newItem)
        presentationMode.wrappedValue.dismiss()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
