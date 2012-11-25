//
//  AppMessageArea.h
//  SysMessageExample
//
//  Created by Randall Nickerson on 11/23/12.
//  Copyright (c) 2012 Threadbare Games. All rights reserved.
//

#import "CCNode.h"
#import "cocos2d.h"

@interface AppMessageArea : CCNode
{
    CCSprite*       msgArea;
    NSMutableArray* msgQueue;
    CGPoint         msgPosition;
    BOOL            isAnimating;
    
}

-(id)initWithPosition:(CGPoint)position;
-(id)initWithPosition:(CGPoint)position andWithSize:(CGSize)size;

-(void)newMessage:(NSString*)messageText;
-(void)showMessages;

-(CCSprite*)messageArea;


@end
