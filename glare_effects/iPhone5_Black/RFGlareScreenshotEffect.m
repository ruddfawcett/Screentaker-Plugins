//
//  RFGlareScreenshotEffect.m
//  iOS Screentaker Plugin
//
//  Created by Rex Finn on 11/13/13.
//  Copyright (c) 2013 Rex Finn. All rights reserved.
//

#import "RFGlareScreenshotEffect.h"

@implementation RFGlareScreenshotEffect

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
    return @"iPhone 5 (Black) Glare";
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
    
    NSImage *image = [[NSImage alloc] initWithSize:NSMakeSize(1182, 2144)];
    [image lockFocus];
    
    /*
     Load the background image from the resource file.
     In order to get the path for the image file, you have to use [[NSBundle bundleForClass:[self class]] pathForResource:resource ofType:type]
     */
    
    NSImage *iPhone5Portrait = [[NSImage alloc] initWithContentsOfFile:[[NSBundle bundleForClass:[self class]] pathForResource:@"iPhone5_Black" ofType:@"png"]];
    
    [iPhone5Portrait drawInRect:NSMakeRect(0, 0, 1182, 2144) fromRect:NSMakeRect(0, 0, 1182, 2144) operation:NSCompositeSourceOver fraction:1]; // Draw the background image
    
    /*
     Draw the screenshot in the screen rect of the background and scale it down if necessary.
     */
    
    [screenshot drawInRect:NSMakeRect(202, 411, 764, 1356) fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1];
    
    /*
     Load the glare image from the resource file.
     In order to get the path for the image file, you have to use [[NSBundle bundleForClass:[self class]] pathForResource:resource ofType:type]
     */
    
    NSImage *iPhone5Glare = [[NSImage alloc] initWithContentsOfFile:[[NSBundle bundleForClass:[self class]] pathForResource:@"iPhone5_Glare" ofType:@"png"]];
    
    [iPhone5Glare drawInRect:NSMakeRect(0, 0, 1182, 2144) fromRect:NSMakeRect(0, 0, 1182, 2144) operation:NSCompositeSourceOver fraction:1]; // Draw the background image
    
    /*
     Draw the glare in the screen rect of the background and scale it down if necessary.
     */
    
    [image unlockFocus];
    
    return image;
}

@end
