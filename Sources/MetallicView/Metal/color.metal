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

[[ stitchable ]] half4 invert(float2 position, half4 color) {
    
    half4 invertedColor = half4(1.0 - color.rgb, color.a);
    
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

[[ stitchable ]] half4 sepia(float2 position, half4 color) {
    
    float grayscaleValue = dot(color.rgb, half3(0.299h, 0.587h, 0.114h));
    half3 sepiaColor = half3(0.439, 0.258, 0.078);
    half4 finalColor = half4(grayscaleValue * sepiaColor, color.a);
    
    return finalColor;
}

[[ stitchable ]] half4 desaturate(float2 position, half4 color, float desaturationLevel) {
    
    half gray = dot(color.rgb, half3(0.299h, 0.587h, 0.114h));
    half4 finalColor = mix(color, half4(gray, gray, gray, color.a), desaturationLevel);

    return finalColor;
}

[[ stitchable ]] half4 threshold(float2 position, half4 color, float thresholdValue) {
    
    half grayscaleValue = dot(color.rgb, half3(0.299h, 0.587h, 0.114h));
    
    half4 finalColor;
    if (grayscaleValue > thresholdValue) {
        // White
        finalColor = half4(1.0h, 1.0h, 1.0h, color.a);
    } else {
        // Black
        finalColor = half4(0.0h, 0.0h, 0.0h, color.a);
    }
    
    return finalColor;
}

[[ stitchable ]] half4 colorChannelSwapRB(float2 position, half4 color) {
    
    half4 swappedColor = half4(color.b, color.g, color.r, color.a);
    
    return swappedColor;
}

[[ stitchable ]] half4 colorChannelSwapRG(float2 position, half4 color) {
    
    half4 swappedColor = half4(color.g, color.r, color.b, color.a);
    
    return swappedColor;
}

[[ stitchable ]] half4 colorChannelSwapGB(float2 position, half4 color) {
    
    half4 swappedColor = half4(color.r, color.b, color.g, color.a);
    
    return swappedColor;
}

[[ stitchable ]] half4 ghost(float2 position, half4 color, float ghostIntensity) {
    
    half4 ghostColor = color;
    ghostColor.a *= ghostIntensity;

    return ghostColor;
}

[[ stitchable ]] half4 gamma(float2 position, half4 color, float gamma) {
    return pow(color, gamma);
}

[[ stitchable ]] half4 hue(float2 position, half4 color, float hue) {
      float newHue = hue * 360.0f;
      while (newHue < 0.0f) {
        newHue += 360.0f;
      }
    
      newHue /= 360.0f;
    
      float newRed = (1.0f - newHue) * color.r + newHue * color.g;
      float newGreen = (1.0f - newHue) * color.g + newHue * color.b;
      float newBlue = (1.0f - newHue) * color.b + newHue * color.r;
    
      return half4(newRed, newGreen, newBlue, color.a);
}
