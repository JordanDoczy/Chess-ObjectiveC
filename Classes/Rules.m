//
//  Rules.m
//  Chess
//
//  Created by Jordan Doczy on 4/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
#import "Board.h"
#import "History.h"
#import "Move.h"
#import "Piece.h"
#import "Rules.h"

@implementation Rules

History *model;

- (id) init{
	return self;
}
- (id) initWithModel:(History*)history{
	
	model = history;
	return [self init];
}

- (BOOL) isValidMove:(Move *)move{
	Piece *from = [[model currentMove] getSquare:move.fromColumn :move.fromRow];
	Piece *to = [[model currentMove] getSquare:move.toColumn :move.toRow];

	if([Rules isSameColor:from :to]) return false;
	if(![from isValidMove:move :[model currentMove]]) return false;
	
	return true;
}

+ (BOOL) isSameColor:(Piece *)from :(Piece *)to{
	return from.color == to.color;
}



@end
