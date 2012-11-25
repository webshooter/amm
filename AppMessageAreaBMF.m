//
//  AppMessageAreaBMF.m
//  SysMessageExample
//
//  Created by Randall Nickerson on 11/24/12.
//  Copyright (c) 2012 Threadbare Games. All rights reserved.
//

#import "AppMessageAreaBMF.h"

@implementation AppMessageAreaBMF

-(id)init
{
    if (self = [super init])
    {
        [self setFontFile:@""];
        [self setFontAlignment:UITextAlignmentCenter];
        [self setFontColor:ccc3(255, 255, 255)];
        [self setOffScreenLocation:ccp(-3000, -3000)];
    }
    return self;
}


-(void)newMessage:(NSString*)messageText
{
    CCLabelBMFont* label = [CCLabelBMFont labelWithString:messageText fntFile:self.fontFile];
    [label setAlignment:self.fontAlignment];
    [label setColor:self.fontColor];
    [label setPosition:msgPosition];
    [msgQueue addObject:label];
}

-(CCLabelBMFont*)getNextMessage
{
    CCLabelBMFont* msg = nil;
    if (msgQueue.count > 0)
    {
        msg = [self cloneMessage:[msgQueue objectAtIndex:0]];
        [msgQueue removeObjectAtIndex:0];
    }
    return msg;
}

-(CCLabelBMFont*)cloneMessage:(CCLabelBMFont*)msg
{
    NSString* msgString      = msg.string;
    NSString* msgFntFile     = msg.fntFile;
    ccColor3B msgFontColor   = msg.color;
    UITextAlignment msgAlign = msg.alignment;
    CGPoint   msgPos         = msg.position;
    CGSize    msgSize        = msg.contentSize;
    CCLabelBMFont* clone = [CCLabelBMFont labelWithString:msgString fntFile:msgFntFile width:msgSize.width alignment:msgAlign];
    [clone setColor:msgFontColor];
    [clone setContentSize:msgSize];
    [clone setPosition:msgPos];
    return clone;
}

-(void)showMessages
{
    if (!isAnimating)
    {
        CCLabelBMFont* msg = (CCLabelBMFont*)[self getNextMessage];
        if (msg != nil)
        {
            [msgArea addChild:msg];
            [msg runAction:[self animationSequence]];
        }
    }
}

-(CCAction*)animationSequence
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}


@end
