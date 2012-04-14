//
//  Piece.m
//  app3
//
//  Created by Jordan Doczy on 3/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Board.h"
#import "GlobalFunctions.h"
#import "Move.h"
#import "NullPiece.h"
#import "Piece.h"

@implementation Piece

@synthesize color;
@synthesize name;
@synthesize moved;

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

- (BOOL) isValidMove:(Move *)move :(Board *)board{
	return true;
}

- (BOOL) isCaptureAttempt:(Piece *)piece{
	if([piece isKindOfClass:[NullPiece class]]) return false;
	if(self.color == piece.color) return false;
	return true;
}


@end
