//
//  AppMessageAreaBMF.h
//  SysMessageExample
//
//  Created by Randall Nickerson on 11/24/12.
//  Copyright (c) 2012 Threadbare Games. All rights reserved.
//

#import "AppMessageArea.h"

@interface AppMessageAreaBMF : AppMessageArea
{
    //
}

@property NSString*       fontFile;
@property UITextAlignment fontAlignment;
@property ccColor3B       fontColor;
@property CGPoint         offScreenLocation;

-(void)newMessage:(NSString*)messageText;
-(void)showMessages;

@end
