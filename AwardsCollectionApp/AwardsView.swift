//
//  AwardsView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.06.2021.
//

import SwiftUI

struct AwardsView: View {
    private let awards = Award.getAwards().filter { $0.awarded }
    var body: some View {
        NavigationView {
            CustomGridView(items: awards, columns: 2) { itemSize, award in
                VStack() {
                    award.awardView
                    Text(award.title)
                }
                .padding()
                .frame(width: itemSize, height: itemSize)
            }
            .navigationBarTitle("Your awards: \(awards.count)")
        }
    }
}

/*
 struct AwardsView: View {
     let awards = Award.getAwards().filter { $0.awarded }
     let columns = [
         GridItem(.adaptive(minimum: 160, maximum: 200))
     ]
     var body: some View {
         NavigationView {
             ScrollView {
                 LazyVGrid(columns: columns) {
                     ForEach(awards, id: \.title) { award in
                         VStack {
                             award.awardView
                             Text(award.title)
                         }
                     }
                 }
                 .navigationTitle("Your awards: \(awards.count)")
             }
         }
     }
 }
 */

struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
    }
}
