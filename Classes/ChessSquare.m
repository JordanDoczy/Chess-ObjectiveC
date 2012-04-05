//
//  Square.m
//  Chess
//
//  Created by Jordan Doczy on 3/27/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ChessSquare.h"
#import "ColumnEnum.h"
#import "RowEnum.h"

@implementation ChessSquare

@synthesize column;
@synthesize row;
@synthesize piece;

- (id) init:(ColumnEnum)_column :(RowEnum)_row{
	column = _column;
	row = _row;
	return self;
}

- (id) copyWithZone:(NSZone *)zone{
    ChessSquare *copy = [[[self class] allocWithZone: zone] init];
	copy.column = column;
	copy.row = row;
    return copy;
}


@end
