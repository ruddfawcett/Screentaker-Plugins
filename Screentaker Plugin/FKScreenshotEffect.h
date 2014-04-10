//
//  FKScreenshotEffect.h
//  iOS Screentaker
//
//  Created by Fabian Kreiser on 23.06.11.
//  Copyright 2011 Fabian Kreiser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

/*
 Screentaker 1.3
*/

// - - - - - - - - - - - - - - - - - - - - - - - - - - - -

enum {
    FKScreenshotEffectDeviceiPhone4S = 10,
    FKScreenshotEffectDeviceiPhone5c = 11,
    FKScreenshotEffectDeviceiPhone5s = 12,
    FKScreenshotEffectDeviceiPodTouch = 13,
    FKScreenshotEffectDeviceiPadAir = 14,
    FKScreenshotEffectDeviceiPadMini = 15,
    FKScreenshotEffectDeviceUnknown = -1,
};
typedef NSInteger FKScreenshotEffectDevice;

#define FKScreenshotEffectDeviceIsValid(device) (device == FKScreenshotEffectDeviceiPhone4S || device == FKScreenshotEffectDeviceiPhone5c || device == FKScreenshotEffectDeviceiPhone5s || device == FKScreenshotEffectDeviceiPodTouch || device == FKScreenshotEffectDeviceiPadAir || device == FKScreenshotEffectDeviceiPadMini)

#define FKScreenshotEffectDeviceIsIphone(device) (device == FKScreenshotEffectDeviceiPhone4S || device == FKScreenshotEffectDeviceiPhone5c || device == FKScreenshotEffectDeviceiPhone5s)
#define FKScreenshotEffectDeviceIsIpad(device) (device == FKScreenshotEffectDeviceiPadAir || device == FKScreenshotEffectDeviceiPadMini)

#define FKScreenshotEffectDeviceIsIphone4Size(device) (device == FKScreenshotEffectDeviceiPhone4S)
#define FKScreenshotEffectDeviceIsIphone5Size(device) (device == FKScreenshotEffectDeviceiPhone5c || device == FKScreenshotEffectDeviceiPhone5s || device == FKScreenshotEffectDeviceiPodTouch)
#define FKScreenshotEffectDeviceIsIpadSize(device) (device == FKScreenshotEffectDeviceiPadAir || device == FKScreenshotEffectDeviceiPadMini)

// - - - - - - - - - - - - - - - - - - - - - - - - - - - -

enum {
    FKScreenshotEffectOrientationPortrait = 0,
    FKScreenshotEffectOrientationLandscapeLeft,
    FKScreenshotEffectOrientationLandscapeRight,
};
typedef NSInteger FKScreenshotEffectOrientation;

#define FKScreenshotEffectOrientationIsValid(orientation) (orientation == FKScreenshotEffectOrientationPortrait || orientation == FKScreenshotEffectOrientationLandscapeLeft || orientation == FKScreenshotEffectOrientationLandscapeRight)

// - - - - - - - - - - - - - - - - - - - - - - - - - - - -

@protocol FKScreenshotEffect <NSObject>
@required

/*
 The version of Screentaker this effect is built for. Must be higher than 1.3.
 */

- (NSString *)screentakerVersion;

/*
 This is the name of the effect shown to the user
 */

- (NSString *)effectDisplayName;

/*
 Specifies whether the effect does support the desired device
 */

- (BOOL)canCreateImageForDevice:(FKScreenshotEffectDevice)device;

/*
 Specifies whether the effect does support the desired orientation
 */

- (BOOL)canCreateImageWithOrientation:(FKScreenshotEffectOrientation)orientation;

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

- (NSImage *)createImageFromScreenshot:(NSImage *)screenshot forDevice:(FKScreenshotEffectDevice)device withOrientation:(FKScreenshotEffectOrientation)orientation;

@end

// - - - - - - - - - - - - - - - - - - - - - - - - - - - -