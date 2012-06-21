//
//  Logger.h
//  Chess
//
//  Created by Jordan Doczy on 6/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Piece.h"

@interface Logger : NSObject {
}

+ (void) logMoves:(NSMutableArray *)moves;
+ (void) logMoves:(NSMutableArray*)moves :(Piece*)piece;


@end
