//
//  AppMessageArea.m
//  SysMessageExample
//
//  Created by Randall Nickerson on 11/23/12.
//  Copyright (c) 2012 Threadbare Games. All rights reserved.
//

#import "AppMessageArea.h"

@implementation AppMessageArea

-(id)init
{
    if (self = [super init])
    {
        
        // Setup message area
        msgArea = [[CCSprite alloc] init];
        [msgArea setContentSize:CGSizeMake(0, 0)];
        msgPosition = ccp(msgArea.contentSize.width/2, msgArea.contentSize.height/2);
        isAnimating = NO;
        
        // Setup message queue
        msgQueue = [[NSMutableArray alloc] init];

    }
    return self;
}

-(id)initWithPosition:(CGPoint)position
{
    if (self = [self init])
    {
        [msgArea setPosition:position];
    }
    return self;
}

-(id)initWithPosition:(CGPoint)position andWithSize:(CGSize)size
{
    if (self = [self initWithPosition:position])
    {
        [msgArea setContentSize:size];
    }
    return self;
}

-(void)startAnimation
{
    isAnimating = YES;
}

-(void)stopAnimation
{
    isAnimating = NO;
}

-(CCSprite*)messageArea
{
    return msgArea;
}

-(void)removeMessageAreaChildren
{
    [msgArea removeAllChildrenWithCleanup:YES];
}

#pragma mark - vv CLASSES THAT MUST BE OVERRIDDEN vv

// Must override newMessage in any subclass !!
-(void)newMessage:(NSString*)messageText
{
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    return;
}


// Must override getNextMessage in any subclass !!
-(CCLabelTTF*)getNextMessage
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}


// Must override cloneMessage in any subclass !!
-(CCLabelTTF*)cloneMessage:(CCLabelTTF*)msg
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}


// Must override showMessages in any subclass !!
-(void)showMessages
{
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    return;
}

// Must override animationSequence in any subclass !!
-(CCAction*)animationSequence
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}


@end
