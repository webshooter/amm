//
//  PulseMessageAreaTTF.h
//  SysMessageExample
//
//  Created by Randall Nickerson on 11/24/12.
//  Copyright (c) 2012 Threadbare Games. All rights reserved.
//

#import "AppMessageAreaTTF.h"

@interface PulseMessageAreaTTF : AppMessageAreaTTF
{
    //
}

@property float  fadeDuration;
@property float  pulseMaxSize;
@property float  pulseMinSize;
@property ccTime pulseMaxDuration;
@property ccTime pulseMinDuration;
@property int    pulseCount;

@end
