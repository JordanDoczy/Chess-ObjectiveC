//
//  Board.m
//  Chess
//
//  Created by Jordan Doczy on 4/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Board.h"
#import "ColorEnum.h"
#import "ColumnEnum.h"
#import "Constants.h"
#import "RowEnum.h"
#import "Piece.h"
#import "NullPiece.h"


@implementation Board

@synthesize squares;

- (void) clearSquare:(int)index{
	[self setSquare:index :[NullPiece alloc]];
}
- (void) clearSquare:(int)column :(int)row{
	[self clearSquare:[Board getIndex:column :row]];
}
+ (int) getColumn:(int)index{
	return index%[Constants COLUMNS];
}
+ (int) getIndex:(int)column :(int)row{
	return (row*[Constants ROWS]) + column;
}
+ (int) getRow:(int)index{
	return floor(index/[Constants ROWS]);
}
- (id) getSquare:(int)index{
	return [squares objectAtIndex:index];
}
- (id) getSquare:(int)column :(int)row{
	return [self getSquare:[Board getIndex:column :row]];
}
- (void) setSquare:(int)index :(Piece*)piece{
	[squares replaceObjectAtIndex:index withObject:piece];
}
- (void) setSquare:(int)column :(int)row :(Piece*)piece{
	[self setSquare:[Board getIndex:column :row] :piece];
}
- (id) init{
	squares = [[NSMutableArray alloc] initWithCapacity:[Constants COLUMNS]*[Constants ROWS]];
	[self initSquares];
	return self;
}
- (void) initSquares{
	int i;
	for (i=0; i<[Constants COLUMNS]*[Constants ROWS]; i++) {
		[squares addObject:[NullPiece alloc]];
	}
}

- (id) copyWithZone:(NSZone *)zone{
    Board *copy = [[[self class] allocWithZone: zone] init];
	copy.squares = [[NSMutableArray alloc] initWithArray:squares copyItems:NO];
	return copy;
}




@end
