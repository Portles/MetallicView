//
//  color.metal
//  MetalicView
//
//  Created by Nizamet Özkan on 10.07.2023.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

[[ stitchable ]] half4 brightness(float2 position, half4 color, float brightness) {
    
    half4 brightenedColor = color + brightness;
    brightenedColor = clamp(brightenedColor, 0.0, 1.0);

    return brightenedColor;
}

[[ stitchable ]] half4 invert_colors(float2 position, half4 color) {
    half4 invertedColor = 1.0 - color;
    return invertedColor;
}

[[ stitchable ]] half4 grayscale(float2 position, half4 color) {
    float grayscaleValue = (color.r + color.g + color.b) / 3.0;
    return half4(grayscaleValue, grayscaleValue, grayscaleValue, color.a);
}

[[ stitchable ]] half4 contrast(float2 position, half4 color, float contrast) {
    half4 adjustedColor = (color - 0.5) * contrast + 0.5;
    return clamp(adjustedColor, 0.0, 1.0);
}

[[ stitchable ]] half4 invert(float2 position, half4 color) {
    half4 invertedColor = half4(1.0 - color.rgb, color.a);
    
    return invertedColor;
}

[[ stitchable ]] half4 sepia(float2 position, half4 color) {

    // Calculate weighted sum of original color channels
    float grayscaleValue = dot(color.rgb, half3(0.299h, 0.587h, 0.114h));

    // Define sepia color
    half3 sepiaColor = half3(0.439, 0.258, 0.078);
    
    // Apply sepia tone
    half4 finalColor = half4(grayscaleValue * sepiaColor, color.a);
    
    return finalColor;
}

[[ stitchable ]] half4 desaturate(float2 position, half4 color, float desaturationLevel) {
    // Calculate the grayscale value
    half gray = dot(color.rgb, half3(0.299h, 0.587h, 0.114h));

    // Interpolate between the original color and the grayscale version based on the desaturation level
    half4 finalColor = mix(color, half4(gray, gray, gray, color.a), desaturationLevel);

    return finalColor;
}

[[ stitchable ]] half4 threshold(float2 position, half4 color, float thresholdValue) {
    // Calculate the grayscale value
    half grayscaleValue = dot(color.rgb, half3(0.299h, 0.587h, 0.114h));
    
    // Apply thresholding
    half4 finalColor;
    if (grayscaleValue > thresholdValue) {
        finalColor = half4(1.0h, 1.0h, 1.0h, color.a);  // White color
    } else {
        finalColor = half4(0.0h, 0.0h, 0.0h, color.a);  // Black color
    }
    
    return finalColor;
}

[[ stitchable ]] half4 colorChannelSwap(float2 position, half4 color) {
    // Swap the red and blue channels
    half4 swappedColor = half4(color.b, color.g, color.r, color.a);
    
    return swappedColor;
}

[[ stitchable ]] half4 ghost(float2 position, half4 color, float ghostIntensity) {
    
    half4 ghostColor = color;
    ghostColor.a *= ghostIntensity;

    return ghostColor;
}
