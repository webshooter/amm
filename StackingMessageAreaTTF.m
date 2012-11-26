//
//  StackingMessageAreaTTF.m
//  AMMExample
//
//  Created by Randall Nickerson on 11/25/12.
//  Copyright (c) 2012 Threadbare Games. All rights reserved.
//

#import "StackingMessageAreaTTF.h"

@implementation StackingMessageAreaTTF

-(id)init
{
    if (self =[super init])
    {
        [self setVisibleDuration:4.0];
        [self setFadeDuration:1.0];
        [self setMoveDuration:0.25];
        [self setVerticalOffset:25];
        [self setMessagesMoveDown:NO];
        
        offset = ( (self.messagesMoveDown)
                   ? ccp(0, -self.verticalOffset)
                   : ccp(0, self.verticalOffset) );
    }
    return self;
}

-(void)showMessages
{
    CCLabelTTF* msg = (CCLabelTTF*)[self getNextMessage];
    if (msg != nil)
    {
        if ([self anyAnimating])
        {
            for (CCNode* child in msgArea.children)
            {
                [child runAction:[CCMoveBy actionWithDuration:self.moveDuration position:offset]];
            }
        }
        else
        {
            if (msgArea.children.count > 0)
            {
                [self removeMessageAreaChildren];
            }
        }
        
        [msgArea addChild:msg];
        id start = [CCCallFuncND actionWithTarget:self selector:@selector(startAnimation:data:) data:msg];
        id stop  = [CCCallFuncND actionWithTarget:self selector:@selector(stopAnimation:data:)  data:msg];
        id seq   = [CCSequence actionOne:start two:[self animationSequence]];
        seq      = [CCSequence actionOne:seq two:stop];
        [msg runAction:seq];
    }
}

-(CCAction*)animationSequence
{
    
    // animation sequence
    id show = [CCDelayTime actionWithDuration:self.visibleDuration];
    id fade = [CCFadeOut actionWithDuration:self.fadeDuration];
    id move = [CCMoveTo actionWithDuration:0 position:self.offScreenLocation];

    return [CCSequence actions:show, fade, move, nil];
}

-(void)startAnimation:(id)source data:(CCLabelTTF*)label
{
    [label setTag:1];
}

-(void)stopAnimation:(id)source data:(CCLabelTTF*)label
{
    [label setTag:0];
}

-(BOOL)anyAnimating
{
    for (CCNode* node in msgArea.children)
    {
        if (node.tag > 0)
        {
            return YES;
        }
    }
    return NO;
}

@end
