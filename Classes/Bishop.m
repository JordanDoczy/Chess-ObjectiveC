//
//  Bishop.m
//  app3
//
//  Created by Jordan Doczy on 3/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Bishop.h"
#import "Board.h"
#import "Move.h"

@implementation Bishop


- (id) init:(ColorEnum)_color{
	
	super.name = @"Bishop";
	[super init: _color];
	return self;
}



@end
