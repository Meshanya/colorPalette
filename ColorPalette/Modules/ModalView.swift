//
//  ModalView.swift
//  ColorPalette
//
//  Created by Michael Borisov on 09.03.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import SwiftUI

struct ModalView: View {
    @State private var showModal = false
    
    var body: some View {
        Button("Show Modal") {
            self.showModal.toggle()
        }.sheet(isPresented: $showModal) {
            InfoView(showModal: self.$showModal)
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
