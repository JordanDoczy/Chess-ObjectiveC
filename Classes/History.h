//
//  History.h
//  Chess
//
//  Created by Jordan Doczy on 4/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Board.h"

@interface History : NSObject {

}

@property (readonly) Board *currentMove;
@property (nonatomic) int currentIndex;

- (void) addMove:(Board*)board;
- (id) init;

	
@end