//
//  AppMessageManager.h
//  SysMessageExample
//
//  Created by Randall Nickerson on 11/23/12.
//  Copyright (c) 2012 Threadbare Games. All rights reserved.
//

#import "CCNode.h"
#import "FadeMessageAreaTTF.h"
#import "PulseMessageAreaTTF.h"
#import "BlinkMessageAreaBMF.h"

@interface AppMessageManager : CCNode
{
    NSMutableDictionary* msgAreas;
}

-(void)addAppMessageArea:(AppMessageArea*)msgArea withName:(NSString*)name;

-(NSMutableDictionary*)getMessageAreas;

-(AppMessageArea*)getAppMessageAreaObjectForName:(NSString*)name;

-(CCSprite*)getMessageAreaSpriteForName:(NSString*)name;

-(void)showMessages;


@end
