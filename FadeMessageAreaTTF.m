//
//  FadeMessageAreaTTF.m
//  SysMessageExample
//
//  Created by Randall Nickerson on 11/24/12.
//  Copyright (c) 2012 Threadbare Games. All rights reserved.
//

#import "FadeMessageAreaTTF.h"

@implementation FadeMessageAreaTTF

-(id)init
{
    if (self = [super init])
    {
        [self setFadeDuration:1.5];
        [self setFadeToMin:0];
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
    
    id fade  = [CCFadeTo actionWithDuration:self.fadeDuration opacity:self.fadeToMin];
    return [CCSequence actions:start, fade, move, stop, clean, nil];
}

@end
