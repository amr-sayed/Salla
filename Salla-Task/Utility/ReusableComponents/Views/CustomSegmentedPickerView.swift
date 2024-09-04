//
//  CustomSegmentedPickerView.swift
//  Lemonada
//
//  Created by Amr Elsayed on 29/07/2023.
//

import SwiftUI

struct CustomSegmentedPickerView: View {
    @Binding var selectedIndex: Int
    var titles: [String]
    @State private var frames = Array<CGRect>(repeating: .zero, count: 3)
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    ForEach(self.titles.indices, id: \.self) { index in
                        Button(
                            action: {
                                self.selectedIndex = index
                                
                            }) {
                            Text(self.titles[index])
                                    .font(.Gillsans.Normal.normal_16)
                                    .foregroundColor(Color.black)
                        }
                        .padding(
                            EdgeInsets(
                                top: 16,
                                leading: 20,
                                bottom: 16,
                                trailing: 20
                            )
                        ).background(
                            GeometryReader { geo in
                                Color.clear.onAppear {
                                    self.setFrame(index: index, frame: geo.frame(in: .global))
                                }
                            }
                        )
                    }
                }
                .background(
                    Capsule()
                        .fill(Color.white)
                        .padding(.horizontal, 7)
                        .padding(.vertical, 7)
                    .frame(width: self.frames[self.selectedIndex].width,
                           height: self.frames[self.selectedIndex].height, alignment: .topLeading)
                    .offset(x: self.frames[self.selectedIndex].minX - self.frames[0].minX)
                    , alignment: .leading
                )
            }
            .animation(.default)
            .background(Capsule().fill(Color("segmentBackground")))
        }
    }
    
    func setFrame(index: Int, frame: CGRect) {
        self.frames[index] = frame
    }
}

struct CustomSegmentedPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSegmentedPickerView(selectedIndex: .constant(0), titles: ["1dds","2dsds","3sdsd", "sdsdsd"])
            .previewLayout(.sizeThatFits)
    }
}
