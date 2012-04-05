//
//  Pawn.m
//  app3
//
//  Created by Jordan Doczy on 3/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Pawn.h"


@implementation Pawn


- (id) init:(ColorEnum)color{
	
	super.name = @"Pawn";
	[super init: color];
	return self;
}

@end
