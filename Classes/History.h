//
//  History.h
//  Chess
//
//  Created by Jordan Doczy on 4/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Board;

@interface History : NSObject {

	int currentIndex;
}

@property (readonly) Board *currentMove;

- (void) addMove:(Board*)board;
- (id) init;
- (void) refresh;
- (int) currentIndex;
- (void) setCurrentIndex:(int)currentIndexValue;
- (void) reset;

	
@end
