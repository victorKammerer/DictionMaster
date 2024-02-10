//
//  PreviewProvider.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 08/02/24.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
}
