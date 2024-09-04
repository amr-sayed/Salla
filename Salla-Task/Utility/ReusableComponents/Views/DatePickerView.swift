//
//  DatePickerView.swift
//  Lemonada
//
//  Created by Amr Elsayed on 21/07/2023.
//

import SwiftUI
import Combine

struct DatePickerView: View {
    
    @Binding var selectedDate: Date
    @Binding var isShown: Bool
    @Binding var shouldDimmPreviousDays: Bool

    var body: some View {
        VStack (alignment: .trailing){
            if shouldDimmPreviousDays {
                DatePicker("Enter your birthday",
                           selection: $selectedDate, in:  Date()... , displayedComponents: [.date])
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .background(Color.white)
            }else {
                DatePicker("Enter your birthday",
                           selection: $selectedDate, displayedComponents: [.date])
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .background(Color.white)
            }
            
            
            HStack {
                Button("Cancel") {
                    isShown.toggle()
                }
                Spacer()
                Button("Done") {
                    isShown.toggle()
                }
            }
            .padding()
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView(selectedDate: .constant(.now), isShown: .constant(true), shouldDimmPreviousDays: .constant(false))
    }
}
