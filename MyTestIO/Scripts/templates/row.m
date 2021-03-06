<%include file="/header_info.mako" />

#import "${data}Row.h"
#import "${data}Cell.h"

@interface ${data}Row ()

@end

@implementation ${data}Row

- (UITableViewCell *)createCellForAutoAdjustedTableViewCell {
    ${data}Cell *cell = [[${data}Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self reuseIdentifier]];
    return cell;
}

- (UITableViewCell *)cellForTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    ${data}Cell *cell = [tableView dequeueReusableCellWithIdentifier:[self reuseIdentifier]];
    if (cell == nil) {
        cell = (${data}Cell *)[self createCellForAutoAdjustedTableViewCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

% if options.autolayout:
- (BOOL)autoAdjustCellHeight {
    return YES;
}
% elif options.height > 0:
- (CGFloat) cellHeight {
    return ${options.height};
}
% endif

- (void)updateCell:(${data}Cell *)cell indexPath:(NSIndexPath *)indexPath {
}

@end




