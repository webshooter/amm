//
//  PulseMessageAreaTTF.m
//  SysMessageExample
//
//  Created by Randall Nickerson on 11/24/12.
//  Copyright (c) 2012 Threadbare Games. All rights reserved.
//

#import "PulseMessageAreaTTF.h"

@implementation PulseMessageAreaTTF

-(id)init
{
    if (self =[super init])
    {
        [self setFadeDuration:0.25];
        [self setPulseMaxSize:1.1];
        [self setPulseMinSize:1.0];
        [self setPulseMaxDuration:0.25];
        [self setPulseMinDuration:0.25];
        [self setPulseCount:3];
    }
    return self;
}

-(CCAction*)animationSequence
{
    // start, stop, move, clean are required
    id start = [CCCallFunc actionWithTarget:self selector:@selector(startAnimation)];
    id stop  = [CCCallFunc actionWithTarget:self selector:@selector(stopAnimation)];
    id move  = [CCMoveTo actionWithDuration:0 position:self.offScreenLocation];
    id clean = [CCCallFunc actionWithTarget:self selector:@selector(removeMessageAreaChildren)];
    
    // animation sequence
    id fade     = [CCFadeOut actionWithDuration:self.fadeDuration];
    id pulseUp  = [CCScaleTo actionWithDuration:self.pulseMaxDuration scale:self.pulseMaxSize];
    id pulseDn  = [CCScaleTo actionWithDuration:self.pulseMinDuration scale:self.pulseMinSize];
    id pulse    = [CCSequence actionOne:pulseUp two:pulseDn];
    id pulseSeq = pulse;
    if (self.pulseCount > 1)
    {
        for (int i=0; i<self.pulseCount-2; i++)
        {
            pulseSeq = [CCSequence actionOne:pulseSeq two:pulse];
        }
    }
    pulseSeq = [CCSequence actionOne:pulseSeq two:fade];
    return [CCSequence actions:start, pulseSeq, move, stop, clean, nil];
}

@end
