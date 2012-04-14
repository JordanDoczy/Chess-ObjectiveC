//
//  Constants.m
//  Chess
//
//  Created by Jordan Doczy on 4/9/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Constants.h"


@implementation Constants

static int columns = 8;
static int rows = 8;
static int squareSize = 40;
static int x_offset = 0;
static int y_offset = 40;

+ (int) COLUMNS{
	return columns;
}
+ (int) ROWS{
	return rows;
}
+ (int) SQUARE_SIZE{
	return squareSize;
}
+ (int) X_OFFSET{
	return x_offset;
}
+ (int) Y_OFFSET{
	return y_offset;
}


@end
