//
//  Square.m
//  Chess
//
//  Created by Jordan Doczy on 6/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Square.h"


@implementation Square

@synthesize column;
@synthesize row;

- (id) init:(ColumnEnum)_column :(RowEnum)_row{
	column = _column;
	row = _row;
	return self;
}

- (void) reset{
	column = -1;
	row = -1;
}

@end
