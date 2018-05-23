function relative_error = safe_relative_error(real, estimated)

scale = max(abs(real), abs(estimated));
% the relative error when both real AND estimated are zero is zero
support = scale > 0;

relative_error = mean(abs(real(support) - estimated(support)) ...
    ./ scale(support)) * 100;
