//
//  Controller.h
//  Chess
//
//  Created by Jordan Doczy on 3/27/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Move;
@class History;

@interface Controller : NSObject {

}
- (id) init;
- (id) initWithModel:(History *)history;
- (void) movePiece:(Move *)move;
- (void) reset;
- (void) setUpBoard;
- (void) undo;

@end
