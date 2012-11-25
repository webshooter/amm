//
//  AppMessageAreaTTF.m
//  SysMessageExample
//
//  Created by Randall Nickerson on 11/24/12.
//  Copyright (c) 2012 Threadbare Games. All rights reserved.
//

#import "AppMessageAreaTTF.h"

@implementation AppMessageAreaTTF

-(id)init
{
    if (self = [super init])
    {
        // Setup defaults
        defaultFontName          = @"Arial";
        defaultFontSize          = 24.0f;
        defaultFontColor         = ccWHITE;
        defaultHorizTextAlign    = UITextAlignmentCenter;
        defaultOffScreenLocation = ccp(-3000, -3000);
        
        // Set vars to default values
        [self setFontName:defaultFontName];
        [self setFontSize:defaultFontSize];
        [self setFontColor:defaultFontColor];
        [self setHorizTextAlign:defaultHorizTextAlign];
        [self setOffScreenLocation:defaultOffScreenLocation];
    }
    return self;
}


-(void)newMessage:(NSString*)messageText
{
    CCLabelTTF* label = [CCLabelTTF labelWithString:messageText
                                           fontName:self.fontName
                                           fontSize:self.fontSize];
    [label setHorizontalAlignment:self.horizTextAlign];
    [label setColor:defaultFontColor];
    [label setPosition:msgPosition];
    [msgQueue addObject:label];
}

-(CCLabelTTF*)getNextMessage
{
    CCLabelTTF* msg = nil;
    if (msgQueue.count > 0)
    {
        msg = [self cloneMessage:[msgQueue objectAtIndex:0]];
        [msgQueue removeObjectAtIndex:0];
    }
    return msg;
}

-(CCLabelTTF*)cloneMessage:(CCLabelTTF*)msg
{
    NSString* msgString      = msg.string;
    NSString* msgFontName    = msg.fontName;
    CGFloat   msgFontSize    = msg.fontSize;
    ccColor3B msgFontColor   = msg.color;
    UITextAlignment msgAlign = msg.horizontalAlignment;
    CGPoint   msgPos         = msg.position;
    CGSize    msgSize        = msg.contentSize;
    CCLabelTTF* clone = [CCLabelTTF labelWithString:msgString fontName:msgFontName fontSize:msgFontSize];
    [clone setColor:msgFontColor];
    [clone setContentSize:msgSize];
    [clone setPosition:msgPos];
    [clone setHorizontalAlignment:msgAlign];
    return clone;
}

-(void)showMessages
{
    if (!isAnimating)
    {
        CCLabelTTF* msg = (CCLabelTTF*)[self getNextMessage];
        if (msg != nil)
        {
            [msgArea addChild:msg];
            [msg runAction:[self animationSequence]];
        }
    }
}

#pragma mark - vv CLASSES THAT MUST BE OVERRIDDEN vv

-(CCAction*)animationSequence
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

@end
