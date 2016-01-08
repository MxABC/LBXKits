

#import "NSDate+LBXCategory.h"

@implementation NSDate(LBXCategory)



- (NSString*)toNSStringWithFormat:(NSString*)format
{
    NSDate *date = [NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:format];
    
    return  [dateformatter stringFromDate:date];
}



@end
