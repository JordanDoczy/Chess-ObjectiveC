//
//  Board.h
//  Chess
//
//  Created by Jordan Doczy on 4/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ColorEnum.h"
#import "ColumnEnum.h"
#import "RowEnum.h"

@class Move;
@class Piece;

@interface Board : NSObject { }

- (void) clearSquare:(int)index;
- (void) clearSquare:(int)column :(int)row;
- (id) copyWithZone:(NSZone *)zone;

+ (int) getColumn:(int)index;
+ (int) getIndex:(int)column :(int)row;
- (id) getItemAtSquare:(int)index;
- (id) getItemAtSquare:(int)column :(int)row;
- (id) getKing:(ColorEnum)color;
- (id) getPositionOfKing:(ColorEnum)color;
+ (int) getRow:(int)index;
- (NSArray *) getPieces:(ColorEnum)color;
- (NSArray *) getPieces;
- (NSArray *) getPossibleMoves:(ColorEnum)color;
- (id) getSquare:(Piece*)piece;

- (id) init;
- (void) initSquares;
- (BOOL) isAdjacentColumn:(Move *)move;
- (BOOL) isColumnRangeEmpty:(Move *)move :(BOOL)includeFromSquare :(BOOL)includeToSquare;
- (BOOL) isDiagonal:(Move *) move;
- (BOOL) isDiagonalRangeEmpty:(Move *) move :(BOOL)includeFromSquare :(BOOL)includeToSquare;
- (BOOL) isRowRangeEmpty:(Move *)move :(BOOL)includeFromSquare :(BOOL)includeToSquare;
- (BOOL) isSquareEmpty:(ColumnEnum)column :(RowEnum)row;

- (void) setSquare:(int)index :(Piece *)piece;
- (void) setSquare:(int)column :(int)row :(Piece *)piece;


@property (nonatomic, retain) NSMutableArray *squares;
	
@end
