//
//  CustomGridView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 01.06.2022.
//

import SwiftUI

struct CustomGridView<Content: View, T>: View {
    let items: [T]
    let columns: Int
    let content: (CGFloat, T) -> Content
    var rows: Int {
        items.count / columns
    }
    
    var body: some View {
        GeometryReader { geometry in
            
            ScrollView {
                VStack(spacing: 32) {
                    ForEach(0 ... rows, id: \.self) { rowIndex in
                        HStack {
                            ForEach(0 ..< columns, id: \.self) { columnIndex in
                                if let index = getIndexFor(row: rowIndex, column: columnIndex) {
                                    let cellSize = geometry.size.width / CGFloat(columns)
                                    content(cellSize, items[index])
                                } else {
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    private func getIndexFor(row: Int, column: Int) -> Int? {
        let index = row * columns + column
        return index < items.count ? index : nil
    }
}

struct CustomGridView_Previews: PreviewProvider {
    static var previews: some View {
        CustomGridView(items: [1, 2, 3], columns: 2) { itemsSize, item in
            Text("\(item)")
        }
//        CustomGridView(delegate: self as! SizeDelegate, items: [1, 2, 3], columns: 2) { itemSize, item in
//            Text("\(item)")
//                .frame(width: itemSize, height: itemSize)
//        }

//        CustomGridView(items: [1, 2, 3, 4, 5, 6, 7], columns: 3) {itemSize, item in
//            Text("\(item)")
//
//        }
    }
}
