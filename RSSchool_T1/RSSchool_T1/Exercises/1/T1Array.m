#import "T1Array.h"

@implementation T1Array

- (NSArray *)convertToHappy:(NSArray *)sadArray {
    
    if(sadArray == nil || sadArray.count == 0){
        return sadArray;
    }
    
    NSMutableArray *sadArrayMutable = [NSMutableArray arrayWithArray:sadArray];
    NSMutableArray *resultArray = sadArrayMutable;
    
    while(![T1Array CheckForHappy: resultArray]){

        resultArray = [[NSMutableArray alloc] init];
        NSUInteger sum = 0;

        id firstObject = sadArrayMutable.firstObject;
        id lastObject = sadArrayMutable.lastObject;

        [resultArray addObject:firstObject];

        for(int i=1; i < sadArrayMutable.count - 1; i++ ){

            id prevElement = [sadArrayMutable objectAtIndex:(i-1)];
            id nextElement = [sadArrayMutable objectAtIndex:(i+1)];
            id element = [sadArrayMutable objectAtIndex:i];

            sum = [prevElement intValue] + [nextElement intValue];

            if(sum > [element intValue]){
                [resultArray addObject:[sadArrayMutable objectAtIndex:i]];
            }
        }

        [resultArray addObject:lastObject];
        sadArrayMutable = resultArray;
    }
    return resultArray;
}

+ (BOOL)CheckForHappy:(NSArray *)checkArray{

    NSUInteger sum = 0;

    for(int i=1; i < checkArray.count - 1; i++ ){

        id prevElement = [checkArray objectAtIndex:(i-1)];
        id nextElement = [checkArray objectAtIndex:(i+1)];
        id element = [checkArray objectAtIndex:i];

        sum = [prevElement intValue] + [nextElement intValue];

            if(sum < [element intValue]){
                return false;
            }
    }
    return true;
}

@end

