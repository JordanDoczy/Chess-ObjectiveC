//
//  Board.h
//  Chess
//
//  Created by Jordan Doczy on 4/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
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
+ (int) getRow:(int)index;
- (id) getSquare:(int)index;
- (id) getSquare:(int)column :(int)row;
- (id) init;
- (void) initSquares;
- (void) setSquare:(int)index :(Piece *)piece;
- (void) setSquare:(int)column :(int)row :(Piece *)piece;

- (BOOL) isAdjacentColumn:(Move *)move;
- (BOOL) isColumnRangeEmpty:(Move *)move;
- (BOOL) isColumnRangeEmpty:(RowEnum)row :(ColumnEnum)fromColumn :(ColumnEnum)toColumn;
- (BOOL) isDiagonalRangeEmpty:(Move *) move;
- (BOOL) isRangeEmpty:(Move *)move;
- (BOOL) isRangeEmptyBetween:(Move *)move;
- (BOOL) isRowRangeEmpty:(Move *)move;
- (BOOL) isRowRangeEmpty:(Move *)move :(BOOL)includeToSquare;
- (BOOL) isRowRangeEmpty:(ColumnEnum)column :(RowEnum)fromRow :(RowEnum)toRow;
- (BOOL) isSquareEmpty:(ColumnEnum)column :(RowEnum)row;


@property (nonatomic, retain) NSMutableArray *squares;
	
@end
