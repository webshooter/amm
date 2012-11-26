//
//  StackingMessageAreaTTF.h
//  AMMExample
//
//  Created by Randall Nickerson on 11/25/12.
//  Copyright (c) 2012 Threadbare Games. All rights reserved.
//

#import "AppMessageAreaTTF.h"

@interface StackingMessageAreaTTF : AppMessageAreaTTF
{
    CGPoint offset;
}

@property ccTime visibleDuration;
@property ccTime fadeDuration;
@property ccTime moveDuration;
@property BOOL messagesMoveDown;
@property float verticalOffset;


@end
