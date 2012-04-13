//
//  Move.m
//  Chess
//
//  Created by Jordan Doczy on 4/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Move.h"

@implementation Move

@synthesize fromColumn;
@synthesize fromRow;
@synthesize toColumn;
@synthesize toRow;

- (id) init:(ColumnEnum)_fromColumn :(RowEnum)_fromRow :(ColumnEnum)_toColumn :(RowEnum)_toRow{
	fromColumn = _fromColumn;
	fromRow = _fromRow;
	toColumn = _toColumn;
	toRow = _toRow;

	return self;
}

- (void) reset{
	fromColumn = -1;
	fromRow = -1;
	toColumn = -1;
	toRow = -1;
}

@end
