//  Created by Maksim Kalik on 8/26/21.

#import "JumpingOnTheClouds.h"


@implementation JumpingOnTheClouds

- (NSNumber *) jumpingOnClouds:(NSArray *)c {
    const int max = 100;
    
    if (c.count <= 0) {
        return 0;
    }
    
    if (c.count == 1) {
        return [c.firstObject isEqual: @1] ? 0 : @1;
    }
    
    if ([c.firstObject isEqual: 0]
        && [[c objectAtIndex:1] isEqual: @1]) {
        return 0;
    };

    int i = 0;
    int jumps = 0;
    
    if (c.count <= max) {
        while (i < c.count) {
            if (i + 2 < c.count && [[c objectAtIndex:i + 2] isEqual:[c objectAtIndex:i]]) {
                i += 2;
                jumps += 1;
            } else if (i + 1 < c.count && [[c objectAtIndex:i + 1] isEqual:[c objectAtIndex:i]]) {
                i += 1;
                jumps += 1;
            } else {
                break;
            }
        }
    }
    
    return [NSNumber numberWithInt:jumps];
}

- (void)run {
    NSArray *clouds = [NSArray arrayWithObjects:@0, @0, @1, @0, @0, @1, @0, nil];
//    NSArray *clouds = [NSArray arrayWithObjects:@0, @1, @0, nil];
    NSLog(@"%@", [self jumpingOnClouds:clouds]);
}

@end
