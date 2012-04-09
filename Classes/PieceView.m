//
//  PieceView.m
//  Chess
//
//  Created by Jordan Doczy on 4/4/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "PieceView.h"


@implementation PieceView

@synthesize column;
@synthesize row;

- (void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    UITouch *touch = [touches anyObject]; 
	CGPoint location = [touch locationInView:self.superview];
    self.center = location;
}

@end
