//
//  AppMessageAreaTTF.h
//  SysMessageExample
//
//  Created by Randall Nickerson on 11/24/12.
//  Copyright (c) 2012 Threadbare Games. All rights reserved.
//

#import "AppMessageArea.h"

@interface AppMessageAreaTTF : AppMessageArea
{
    // Defaults
    NSString*       defaultFontName;
    float           defaultFontSize;
    ccColor3B       defaultFontColor;
    UITextAlignment defaultHorizTextAlign;
    CGPoint         defaultOffScreenLocation;
}

@property NSString*       fontName;
@property float           fontSize;
@property ccColor3B       fontColor;
@property UITextAlignment horizTextAlign;
@property CGPoint         offScreenLocation;

-(void)newMessage:(NSString*)messageText;
-(void)showMessages;

@end
