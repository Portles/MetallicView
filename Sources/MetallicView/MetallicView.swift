//
//  MetallicView.swift
//
//
//  Created by Nizamet Özkan on 21.07.2023.
//

import SwiftUI

public extension View {
    
    /**
     This method brightens colors and returns to view.

     This methods adds two value and return the View.
     Brightness value recommended between 0.0 - 10.0

     - parameter brightness: Brightness control.
     - parameter isEnabled: Enable control.
     - returns: Brightened colors.

     # Notes: #
     1. First Parameter must be **CGFloat** type
     2. Second Parameter must be **Bool** type
     3. Must return on a view.

     # Example #
    ```
    View()
     .metallicBrightness(brightness: $brightness, isEnabled: $enabled)
     ```
    */
    @ViewBuilder
    func metallicBrightness(brightness: Binding<CGFloat>, isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.brightness.rawValue), arguments: [.float(brightness.wrappedValue)]), isEnabled: isEnabled)
    }
    
    /**
     This method invert color and returns to view.

     This method use enable control and return the View.

     - parameter isEnabled: Enable control.
     - returns: Inverted color.

     # Notes: #
     1. First Parameter must be **Bool** type
     2. Must return on a view.

     # Example #
    ```
    View()
     .metallicInvert(isEnabled: $enabled)
     ```
    */
    @ViewBuilder
    func metallicInvert(isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.invert.rawValue), arguments: []), isEnabled: isEnabled)
    }
    
    /**
     This method grayscale colors and returns to view.

     This method use enable control and return the View.
        
     - parameter isEnabled: Enable control.
     - returns: Grayscaled colors.

     # Notes: #
     1. First Parameter must be **Bool** type
     2. Must return on a view.

     # Example #
    ```
    View()
     .metallicGrayscale(isEnabled: $enabled)
     ```
    */
    @ViewBuilder
    func metallicGrayscale(isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.grayscale.rawValue), arguments: []), isEnabled: isEnabled)
    }
    
    /**
     This method get contrast value and returns to view.

     This method get contrast value and use enable control to return the View.
     Contrast value recommended between 0.0 - 1.0
        
     - parameter contrast: Contrast control.
     - parameter isEnabled: Enable control.
     - returns: Contrast setted colors.

     # Notes: #
     1. First Parameter must be **CGFloat** type
     2. Second Parameter must be **Bool** type
     3. Must return on a view.

     # Example #
    ```
    View()
     .metallicContrast(contrast: $contrast, isEnabled: $enabled)
     ```
    */
    @ViewBuilder
    func metallicContrast(contrast: Binding<CGFloat>,isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.contrast.rawValue), arguments: [.float(contrast.wrappedValue)]), isEnabled: isEnabled)
    }
    
    /**
     This method changes view colors to sepia and returns to view.

     This method use enable control and return the View.
        
     - parameter isEnabled: Enable control.
     - returns: Sepiadic colors.

     # Notes: #
     1. First Parameter must be **Bool** type
     2. Must return on a view.
        
     # Example #
    ```
    View()
     .metallicSepia(isEnabled: $enabled)
     ```
    */
    @ViewBuilder
    func metallicSepia(isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.sepia.rawValue), arguments: []), isEnabled: isEnabled)
    }
    
    /**
     This method change desaturation of view colors and returns to view.

     This method use enable control and get desaturation level to return the View.
     Recommended to set desaturation level between 0.0 - 50.0
     
     - parameter desaturationLevel: Desaturation control.
     - parameter isEnabled: Enable control.
     - returns: Desaturated colors.

     # Notes: #
     1. First Parameter must be **CGFloat** type
     2. Second Parameter must be **Bool** type
     3. Must return on a view.
        
     # Example #
    ```
    View()
     .metallicDesaturate(desaturationLevel: $desaturation, isEnabled: $enabled)
     ```
    */
    @ViewBuilder
    func metallicDesaturate(desaturationLevel: Binding<CGFloat>, isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.desaturate.rawValue), arguments: [.float(desaturationLevel.wrappedValue)]), isEnabled: isEnabled)
    }
    
    /**
     This method get threshold level and returns to view.

     This method use enable control and get threshold level to return the View.
     Recommended to set threshold level between 0.0 - 1.0
     
     - parameter threshold: Threshold control.
     - parameter isEnabled: Enable control.
     - returns: Thresholded colors.

     # Notes: #
     1. First Parameter must be **CGFloat** type
     2. Second Parameter must be **Bool** type
     3. Must return on a view.
        
     # Example #
    ```
    View()
     .metallicThreshold(threshold: $threshold, isEnabled: $enabled)
     ```
    */
    @ViewBuilder
    func metallicThreshold(threshold: Binding<CGFloat>, isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.threshold.rawValue), arguments: [.float(threshold.wrappedValue)]), isEnabled: isEnabled)
    }
    
    /**
     This method swaps red and blue color and returns to view.

     This method use enable control to return the View.
     
     - parameter isEnabled: Enable control.
     - returns: Swaped colors.

     # Notes: #
     1. First Parameter must be **Bool** type
     2. Must return on a view.
        
     # Example #
    ```
    View()
     .metallicColorChannelSwapRB(isEnabled: $enabled)
     ```
    */
    @ViewBuilder
    func metallicColorChannelSwapRB(isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.colorChannelSwapRB.rawValue), arguments: []), isEnabled: isEnabled)
    }
    
    /**
     This method swaps red and green color and returns to view.

     This method use enable control to return the View.
     
     - parameter isEnabled: Enable control.
     - returns: Swaped colors.

     # Notes: #
     1. First Parameter must be **Bool** type
     2. Must return on a view.
        
     # Example #
    ```
    View()
     .metallicColorChannelSwapRG(isEnabled: $enabled)
     ```
    */
    @ViewBuilder
    func metallicColorChannelSwapRG(isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.colorChannelSwapRG.rawValue), arguments: []), isEnabled: isEnabled)
    }
    
    /**
     This method swaps green and blue color and returns to view.

     This method use enable control to return the View.
     
     - parameter isEnabled: Enable control.
     - returns: Swaped colors.

     # Notes: #
     1. First Parameter must be **Bool** type
     2. Must return on a view.
        
     # Example #
    ```
    View()
     .metallicColorChannelSwapGB(isEnabled: $enabled)
     ```
    */
    @ViewBuilder
    func metallicColorChannelSwapGB(isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.colorChannelSwapGB.rawValue), arguments: []), isEnabled: isEnabled)
    }
    
    /**
     This method get ghost level and returns to view.

     This method use enable control and get ghost level to return the View.
     Recommended to set ghost level between 0.0 - 1.0
     
     - parameter ghost: Ghost control.
     - parameter isEnabled: Enable control.
     - returns: Ghosted colors.

     # Notes: #
     1. First Parameter must be **CGFloat** type
     2. Second Parameter must be **Bool** type
     3. Must return on a view.
        
     # Example #
    ```
    View()
     .metallicGhost(ghost: $ghost, isEnabled: $enabled)
     ```
    */
    @ViewBuilder
    func metallicGhost(ghost: Binding<CGFloat>, isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.ghost.rawValue), arguments: [.float(ghost.wrappedValue)]), isEnabled: isEnabled)
    }
    
    /**
     This method get gamma level and returns to view.

     This method use enable control and get gamma level to return the View.
     Recommended to set gamma level between 0.0 - 65.0
     
     - parameter gamma: Gamma control.
     - parameter isEnabled: Enable control.
     - returns: Gamma  colors.

     # Notes: #
     1. First Parameter must be **CGFloat** type
     2. Second Parameter must be **Bool** type
     3. Must return on a view.
        
     # Example #
    ```
    View()
     .metallicGamma(gamma: $gamma, isEnabled: $enabled)
     ```
    */
    @ViewBuilder
    func metallicGamma(gamma: Binding<CGFloat>, isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.gamma.rawValue), arguments: [.float(gamma.wrappedValue)]), isEnabled: isEnabled)
    }
    
    /**
     This method get hue level and returns to view.

     This method use enable control and get hue level to return the View.
     Recommended to set hue level between 0.0 - 50.0
     Full range is between 0.0 - 360.0
     
     - parameter hue: Hue control.
     - parameter isEnabled: Enable control.
     - returns: Hue colors.

     # Notes: #
     1. First Parameter must be **CGFloat** type
     2. Second Parameter must be **Bool** type
     3. Must return on a view.
        
     # Example #
    ```
    View()
     .metallicHue(hue: $hue, isEnabled: $enabled)
     ```
    */
    @ViewBuilder
    func metallicHue(hue: Binding<CGFloat>, isEnabled: Bool = true) -> some View {
        self
            .colorEffect(Shader(function: .init(library: .default, name: MetallicFunctions.hue.rawValue), arguments: [.float(hue.wrappedValue)]), isEnabled: isEnabled)
    }
}
