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
        
        anyMessagesMoving = NO;
    }
    return self;
}

-(void)showMessages
{
    
    // Don't add a new message while a previous message is moving
    if (!anyMessagesMoving)
    {
        CCLabelTTF* msg = (CCLabelTTF*)[self getNextMessage];
        if (msg != nil)
        {
            if ([self anyAnimating])  // are any messages still in the fade out animation?
            {
                for (CCNode* child in msgArea.children)
                {
                    id startmoving = [CCCallFuncND actionWithTarget:self selector:@selector(markMoving:data:) data:YES];
                    id move        = [CCMoveBy actionWithDuration:self.moveDuration position:offset];
                    id stopmoving  = [CCCallFuncND actionWithTarget:self selector:@selector(markMoving:data:) data:NO];
                    [child runAction:[CCSequence actions:startmoving, move, stopmoving, nil]];
                }
            }
            else  // any messages have faded, remove them
            {
                if (msgArea.children.count > 0)
                {
                    [self removeMessageAreaChildren];
                }
            }
            
            [msg setOpacity:0];
            [msgArea addChild:msg];
            id wait  = [CCDelayTime actionWithDuration:2];
            id start = [CCCallFuncND actionWithTarget:self selector:@selector(startAnimation:data:) data:msg];
            id stop  = [CCCallFuncND actionWithTarget:self selector:@selector(stopAnimation:data:)  data:msg];
            id seq   = start;
            if (anyMessagesMoving)
            {
                seq = [CCSequence actionOne:wait two:seq];
            }
            seq = [CCSequence actionOne:seq two:[self animationSequence]];
            seq = [CCSequence actionOne:seq two:stop];
            [msg runAction:seq];
        }
    }
}

-(CCAction*)animationSequence
{
    
    // animation sequence
    id fadein  = [CCFadeIn actionWithDuration:0.25];
    id show    = [CCDelayTime actionWithDuration:self.visibleDuration];
    id fadeout = [CCFadeOut actionWithDuration:self.fadeDuration];
    id move    = [CCMoveTo actionWithDuration:0 position:self.offScreenLocation];

    return [CCSequence actions:fadein, show, fadeout, move, nil];
}

-(void)startAnimation:(id)source data:(CCLabelTTF*)label
{
    [label setTag:1];
}

-(void)stopAnimation:(id)source data:(CCLabelTTF*)label
{
    [label setTag:0];
}

-(void)markMoving:(id)source data:(BOOL)moving
{
    anyMessagesMoving = moving;
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
