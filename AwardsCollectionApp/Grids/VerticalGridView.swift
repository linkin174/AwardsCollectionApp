//
//  VerticalGridView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 01.06.2022.
//

import SwiftUI

struct VerticalGridView: View {
    let dataSet = (1...100).map { "Item \($0)" }
    let columns = [
        GridItem(.fixed(70)),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(dataSet, id: \.self) { item in
                    Text(item)
                }
            }
        }
    }
}

struct VerticalGridView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalGridView()
    }
}
