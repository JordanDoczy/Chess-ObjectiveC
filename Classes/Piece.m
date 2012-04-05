//
//  Piece.m
//  app3
//
//  Created by Jordan Doczy on 3/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ColorEnum.h"
#import "GlobalFunctions.h"
#import "Piece.h"
#import "ColumnEnum.h"
#import "RowEnum.h"

@implementation Piece

@synthesize color;
@synthesize name;

- (id) init:(ColorEnum)_color {
	
	self.color = _color;
	return self;
}

- (NSString*) display{
	
	NSString* s;
	
	s = [GlobalFunctions colorEnumToString:color];  
	s = [s stringByAppendingString:name];

	return s;
}

- (id) copyWithZone:(NSZone *)zone{
    Piece *copy = [[[self class] allocWithZone: zone] init];
	copy.color = color;
	copy.name = name;
    return copy;
}

@end
