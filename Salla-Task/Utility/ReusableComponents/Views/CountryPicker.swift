//
//  PickerView.swift
//  Lemonada
//
//  Created by Amr Elsayed on 09/07/2023.
//

import SwiftUI

struct CountryPicker: View {
    @State var items: [Country]
    @State var filteredItems: [Country] = .init()
    
    let title: String
    @State var selectedId = -1
    let submitAction: ((Int) -> Void)?
    @State var contentHeight: Double = 0.0
    @State var inputField: String = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                VStack (alignment: .leading, spacing: Spacing.space_26) {
                    searchView
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: Spacing.space_16) {
                            Text(title)
                                .font(.Gillsans.Bold.bold_21)
                            let list = getDataSource()
                            ForEach((0..<list.count), id: \.self) { index in
                                ItemView(item: list[index].itemString, isSelected: selectedId == list[index].CountryId)
                                    .onTapGesture {
                                        selectedId = list[index].CountryId
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
                    submitAction?(selectedId)
                }
                .padding(.top, 20)
                
            }
            .padding()
            .background(Color.white)
        }
    }
    
    func getDataSource() -> [Country] {
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


struct CountryPicker_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(items: [Dummy(), Dummy(), Dummy()], title: "Reservation Type", submitAction: { val in
            print(val)
        })
    }
}

