//
//  Move.h
//  Chess
//
//  Created by Jordan Doczy on 4/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ColumnEnum.h"
#import "RowEnum.h"

@interface Move : NSObject {
	ColumnEnum fromColumn;
	RowEnum fromRow;
	ColumnEnum toColumn;
	RowEnum toRow;
}

@property (nonatomic) ColumnEnum fromColumn;
@property (nonatomic) RowEnum fromRow;
@property (nonatomic) ColumnEnum toColumn;
@property (nonatomic) RowEnum toRow;

- (id) init:(ColumnEnum)_fromColumn :(RowEnum)_fromRow :(ColumnEnum)_toColumn :(RowEnum)_toRow;
- (void) reset;
	
@end
