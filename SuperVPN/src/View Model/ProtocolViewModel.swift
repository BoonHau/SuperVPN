//
//  ProtocolViewModel.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 21/07/2024.
//

import Foundation

class ProtocolViewModel: BaseViewModel {
    
    @Published var protocols: [ProtocolEntity] = []

    func fetchProtocols() {
        self.protocols = DummyData.getProtocols()
    }
}
