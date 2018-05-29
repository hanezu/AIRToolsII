function [relative_error,sparsity,sparsity_acc] = evaluate(real, estimated)

% support = real ~= 0;

% relative_error = mean(abs(real(support) - estimated(support, :)) ...
%     ./ real(support), 1) * 100;

relative_error = 100 * sum((real - estimated).^2, 1) /sum(real.^2);

sparsity = sum(estimated == 0, 1);

sparsity_acc = sum(real == 0 & estimated == 0, 1) / sum(real == 0) * 100;
