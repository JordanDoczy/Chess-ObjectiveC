//
//  Pawn.m
//  app3
//
//  Created by Jordan Doczy on 3/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Pawn.h"


@implementation Pawn


- (id) init:(ColorEnum)_color{
	
	super.name = @"Pawn";
	[super init: _color];
	return self;
}

@end
