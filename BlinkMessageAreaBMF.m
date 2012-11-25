//
//  BlinkMessageAreaBMF.m
//  SysMessageExample
//
//  Created by Randall Nickerson on 11/24/12.
//  Copyright (c) 2012 Threadbare Games. All rights reserved.
//

#import "BlinkMessageAreaBMF.h"

@implementation BlinkMessageAreaBMF

-(id)init
{
    if (self = [super init])
    {
        [self setBlinkCount:0]; // blinkCount = 0 means blink forever
        [self setBlinkOnDuration:0.5];
        [self setBlinkOffDuration:0.25];
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
    id blinkon  = [CCFadeIn  actionWithDuration:0.01];
    id blinkoff = [CCFadeOut actionWithDuration:0.01];
    id ondelay  = [CCDelayTime actionWithDuration:self.blinkOnDuration];
    id offdelay = [CCDelayTime actionWithDuration:self.blinkOffDuration];
    
    id blinkOnSeq  = [CCSequence actionOne:blinkon  two:ondelay];
    id blinkOffSeq = [CCSequence actionOne:blinkoff two:offdelay];

    id blink    = [CCSequence actionOne:blinkOnSeq two:blinkOffSeq];
    id blinkSeq = blink;
    if (self.blinkCount < 1)
    {
        return [CCRepeatForever actionWithAction:blinkSeq];
    }
    else if (self.blinkCount > 1)
    {
        for (int i=0; i<self.blinkCount-2; i++)
        {
            blinkSeq = [CCSequence actionOne:blinkSeq two:blink];
        }
        return [CCSequence actions:start, blinkSeq, move, stop, clean, nil];
    }
}

@end
