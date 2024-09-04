//
//  PickerView.swift
//  Lemonada
//
//  Created by Amr Elsayed on 09/07/2023.
//

import SwiftUI

struct PickerView: View {
    @State var items: [Itemrepresentable]
    @State var filteredItems: [Itemrepresentable] = .init()
    
    let title: String
    @State var selectedIndex = -1
    let submitAction: ((Int) -> Void)?
    @State var contentHeight: Double = 0.0
    @State var inputField: String = ""
    var shouldShowSearch = false
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                VStack (alignment: .leading, spacing: Spacing.space_26) {
                    if shouldShowSearch {
                        searchView
                    }
                    ScrollView {
                        VStack(alignment: .leading, spacing: Spacing.space_16) {
                            Text(title)
                                .font(.Gillsans.Bold.bold_21)
                            let list = getDataSource()
                            ForEach((0..<list.count), id: \.self) { index in
                                ItemView(item: list[index].itemString, isSelected: selectedIndex == index)
                                    .onTapGesture {
                                        selectedIndex = index
                                    }
                            }
                        }
                        .background(
                            GeometryReader { proxy in
                                Color.clear.onAppear {
                                    contentHeight = proxy.size.height
                                }
                            }
                        )
                    }
                }
                .frame(maxHeight: contentHeight)
                LemonadaButton(buttonTitle: "Submit") {
                    submitAction?(selectedIndex)
                }
                .padding(.top, 20)
                
            }
            .padding()
            .background(Color.white)
        }
    }
    
    func getDataSource() -> [Itemrepresentable] {
        if filteredItems.count > 0 {
            return filteredItems
        }else {
            return items
        }
    }
    
    var searchView: some View {
        HStack {
            VStack {
                HStack(spacing: 0) {
                    Image("search")
                        .padding()
                    
                    TextField("Search", text: $inputField)
                        .frame(height: 45.0)
                        .onChange(of: inputField) { newValue in
                            self.filteredItems = self.items.filter{$0.itemString.lowercased().contains(newValue.lowercased()) }
                        }
                }
            }
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(ReusableComponents.LemonadaCustomField.opacity))
            }
        }
    }
}

struct ItemView: View {
    var item: String
    var isSelected : Bool
    var body: some View {
        HStack {
            HStack {
                Text(item)
                    .frame(height: ReusableComponents.LemonadaCustomField.height)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Image(isSelected ? "selected" : "unselected")
                    .padding()
                
            }
            .background(Color("lightGrey"))
            .cornerRadius(ReusableComponents.LemonadaCustomField.cornerRadius)
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(items: [Dummy(), Dummy(), Dummy()], title: "Reservation Type", submitAction: { val in
            print(val)
        })
    }
}

protocol Itemrepresentable {
    var itemString: String { get  }
}

struct Dummy : Itemrepresentable {
    var itemString: String {
        return "hello"
    }
}
