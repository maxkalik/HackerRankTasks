//  Created by Maksim Kalik on 8/26/21.

#import "CountingValleys.h"

@implementation CountingValleys

- (NSNumber *) countingValleys:(NSNumber *)steps path:(NSString *)path {
    
    const int min = 2;
    const int max = 1000000;
    
    BOOL isInValley = NO;
    int valleys = 0;
    
    BOOL isValid = path.length >= min
    && path.length <= max
    && steps.intValue >= min
    && steps.intValue <= max
    && steps.intValue == path.length;
    
    if (isValid) {
        int count = 0;
        int position = 0;
        while (count < steps.intValue) {
            unichar pathStep = [path characterAtIndex:count];
            if (pathStep == 'U') position += 1;
            if (pathStep == 'D') position -= 1;
            if (position < 0 && isInValley == NO) {
                isInValley = YES;
                valleys += 1;
            }
            if (position == 0 && isInValley == YES) {
                isInValley = NO;
            }
            count += 1;
        }
    }
    return [NSNumber numberWithInteger:valleys];
}

- (void) run {
    char str[50] = {0};
    int num = 0;
    
    printf("Enter steps: ");
    scanf("%d", &num);
    
    printf("Enter path: ");
    scanf("%s", str);
    
    NSNumber *step = [NSNumber numberWithInteger:num];
    NSString *path = [NSString stringWithUTF8String:str];
    
    NSLog(@"%@", [self countingValleys:step path:path]);
}

@end
