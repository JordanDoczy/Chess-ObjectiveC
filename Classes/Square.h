//
//  Square.h
//  Chess
//
//  Created by Jordan Doczy on 6/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ColumnEnum.h"
#import "RowEnum.h"

@interface Square : NSObject {
	ColumnEnum column;
	RowEnum row;
}

@property (nonatomic) ColumnEnum column;
@property (nonatomic) RowEnum row;

- (id) init:(ColumnEnum)_column :(RowEnum)_row;
- (void) reset;


@end
