//
//  Piece.h
//  app3
//
//  Created by Jordan Doczy on 3/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ColorEnum.h"

@interface Piece : NSObject {

}

@property (nonatomic) ColorEnum color;
@property (nonatomic, retain) NSString *name;

- (id) copyWithZone:(NSZone *)zone;
- (NSString*)display;
- (id) init:(ColorEnum)_color;

@end
