//
//  AppMessageManager.m
//  SysMessageExample
//
//  Created by Randall Nickerson on 11/23/12.
//  Copyright (c) 2012 Threadbare Games. All rights reserved.
//

#import "AppMessageManager.h"

@implementation AppMessageManager



-(id)init
{
    if (self = [super init])
    {
        msgAreas = [[NSMutableDictionary alloc] init];
        [self schedule:@selector(showMessages) interval:0.1];
    }
    return self;
}

-(void)addAppMessageArea:(AppMessageArea *)msgArea
                withName:(NSString*)name
{
    if (msgArea != nil)
    {
        [msgAreas setObject:msgArea forKey:name];
    }
}

-(NSMutableDictionary*)getMessageAreas
{
    return msgAreas;
}

-(AppMessageArea*)getAppMessageAreaObjectForName:(NSString*)name
{
    return [msgAreas objectForKey:name];
}

-(CCSprite*)getMessageAreaSpriteForName:(NSString*)name
{
    return [[self getAppMessageAreaObjectForName:name] messageArea];
}

-(void)showMessages
{
    for (NSString* key in msgAreas)
    {
        id value = [msgAreas objectForKey:key];
        AppMessageArea* area = (AppMessageArea*)value;
        [area showMessages];
    }
}


@end
