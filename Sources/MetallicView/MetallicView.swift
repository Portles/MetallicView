//
//  MetallicView.swift
//
//
//  Created by Nizamet Özkan on 21.07.2023.
//

import SwiftUI

public extension View {
    // 0.0 - 10.0
    func metallicbrightness(brightness: Float = 0.0, isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.brightness.rawValue), arguments: [.float(brightness)]), isEnabled: isEnabled)
    }
    
    /**
     This method invert color and returns to view.

     Here is the discussion. This methods adds two double and return the optional Double.

     - parameter isEnabled: Enable control.
     - returns: Inverted color.

     # Notes: #
     1. First Parameter must be **bool** type
     2. Must return on a view.

     # Example #
    ```
    View()
     .metallicinvert(isEnabled: $isEnabled)
     ```
    */
    func metallicInvert(isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.invert.rawValue), arguments: []), isEnabled: isEnabled)
    }
    
    func metallicGrayscale(isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.grayscale.rawValue), arguments: []), isEnabled: isEnabled)
    }
    // 0.0 - 1.0
    func metallicContrast(contrast: Float = 0.5,isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.contrast.rawValue), arguments: [.float(contrast)]), isEnabled: isEnabled)
    }
    
    func metallicSepia(isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.sepia.rawValue), arguments: []), isEnabled: isEnabled)
    }
    // 0.0 - 50.0
    func metallicDesaturate(desaturationLevel: Float = 5.0,isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.desaturate.rawValue), arguments: [.float(desaturationLevel)]), isEnabled: isEnabled)
    }
    // 0.0 - 1.0
    func metallicThreshold(threshold: Float = 0.1,isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.threshold.rawValue), arguments: []), isEnabled: isEnabled)
    }
    
    func metallicColorChannelSwap(isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.colorChannelSwap.rawValue), arguments: []), isEnabled: isEnabled)
    }
    // 0.0 - 1.0
    func metallicGhost(ghost: Float = 0.2, isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.ghost.rawValue), arguments: []), isEnabled: isEnabled)
    }
}
