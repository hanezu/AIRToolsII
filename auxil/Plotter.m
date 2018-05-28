classdef Plotter
    properties
       x
       N
       c
       k
       A
    end
    methods 
        function this = Plotter(x, N, c, k, A) 
            this.x = x;
            this.N = N;
            this.c = c;
            this.k = k;
            this.A = A;
        end
        function plot(this, X)
            clf
            subplot(2, 2, 1);
            imagesc(reshape(X(:, end),this.N,this.N)), colormap gray, axis image off;
            caxis(this.c);
            title('重构图像');
            [relative_error,sparsity,sparsity_acc] = evaluate(this.x, X);
            subplot(2, 2, 2);
            t = this.k * size(this.A,1);
            semilogx(t, relative_error)
            xlabel('迭代次数')
            ylabel('相对误差(%)')
            title('相对误差')
            fprintf(1, '相对误差下降至 %f %%\n', relative_error(end))
            subplot(2, 2, 3);
            semilogx(t, sparsity)
            xlabel('迭代次数')
            ylabel('零元素个数')
            title('稀疏度')
            subplot(2, 2, 4);
            semilogx(t, sparsity_acc)
            xlabel('迭代次数')
            ylabel('稀疏准确率(%)')
            title('稀疏准确率')
        end
        function compare(this, varargin)
            clf
            % first input: legend names in cell array
            % others: result of RSKs for comparison
            a1 = subplot(2, 2, 1);
            a2 = subplot(2, 2, 2);
            a3 = subplot(2, 2, 3);
            a4 = subplot(2, 2, 4, 'Position', [0.6, 0.25, 0.1, 0.1]);
            pos_a4 = get(a4,'position');
            xlabel(a1, '迭代次数')
            ylabel(a1, '相对误差(%)')
            title(a1, '相对误差')
            xlabel(a2, '迭代次数')
            ylabel(a2, '零元素个数')
            title(a2, '稀疏度')
            xlabel(a3, '迭代次数')
            ylabel(a3, '稀疏准确率(%)')
            title(a3, '稀疏准确率')
            set(a1, 'xscale','log')
            set(a2, 'xscale','log')
            set(a3, 'xscale','log')
            t = this.k * size(this.A,1);
            hold(a1, 'on')
            hold(a2, 'on')
            hold(a3, 'on')
            names = varargin{1};
            for i = 2:nargin - 1
                X = varargin{i};
                [relative_error,sparsity,sparsity_acc] = evaluate(this.x, X);
                
                h1 = plot(a1, t, relative_error);
                h2 = plot(a2, t, sparsity);
                h3 = plot(a3, t, sparsity_acc);
            end
            lgd = legend(a1, names);
            set(lgd,'position',pos_a4);      % Adjusting legend's position
            axis(a4,'off');                 % Turning its axis off
            hold off
        end
    end
end