//
//  RF5CColorEffect.m
//  iOS Screentaker Plugin
//
//  Created by Rex Finn on 11/13/13.
//  Copyright (c) 2013 Rex Finn. All rights reserved.
//

#import "RF5CColorEffect.h"

@implementation RF5CColorEffect

/*
 Minimum version of Screentaker this effect requires.
 */

- (NSString *)screentakerVersion
{
    return @"1.3";
}

/*
 This is the name of the effect shown to the user
 */

- (NSString *)effectDisplayName {
    return @"iPhone 5C - Color";
}

/*
 Specifies whether the effect does support the desired device
 */

- (BOOL)canCreateImageForDevice:(FKScreenshotEffectDevice)device {
    return (device == FKScreenshotEffectDeviceiPhone5s); // iPod touch and iPad are unsupported
}

/*
 Specifies whether the effect does support the desired orientation
 */

- (BOOL)canCreateImageWithOrientation:(FKScreenshotEffectOrientation)orientation {
    return (orientation == FKScreenshotEffectOrientationPortrait); // Landscape orientations are unsupported
}

/*
 - 'screenshot' is an image with the following sizes (portrait):
 - 320x480 or 640x960 for iPhone 4S
 - 640x1136 for iPhone 5c, iPhone 5s or iPod touch
 - 768x1024 for iPad Air and iPad mini
 - 'device' is the device the user wants the screenshot to be shown on
 - 'orientation' is the orientation of the screenshot
 
 Return value:
 An image with an arbitrary size showing the screenshot on the desired device with the desired orientation
 */

- (NSImage *)createImageFromScreenshot:(NSImage *)screenshot forDevice:(FKScreenshotEffectDevice)device withOrientation:(FKScreenshotEffectOrientation)orientation {
    /*
     Create the output image with the desired size
     */
    
    NSImage *image = [[NSImage alloc] initWithSize:NSMakeSize(650, 1365)];
    [image lockFocus];
    
    /*
     Load the background image from the resource file.
     In order to get the path for the image file, you have to use [[NSBundle bundleForClass:[self class]] pathForResource:resource ofType:type]
     */
    
    NSImage *iPhone5Portrait = [[NSImage alloc] initWithContentsOfFile:[[NSBundle bundleForClass:[self class]] pathForResource:@"iPhone5C_Color" ofType:@"png"]];
    
    [iPhone5Portrait drawInRect:NSMakeRect(0, 0, 650, 1365) fromRect:NSMakeRect(0, 0, 650, 1365) operation:NSCompositeSourceOver fraction:1]; // Draw the background image
    
    /*
     Draw the screenshot in the screen rect of the background and scale it down if necessary.
     */
    
    [screenshot drawInRect:NSMakeRect(57, 204, 537, 959) fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1];
    
    [image unlockFocus];
    
    return image;
}

@end
