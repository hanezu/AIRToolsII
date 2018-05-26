classdef Plotter
    properties
       x
       N
       c
       k
       print_info
    end
    methods 
        function this = Plotter(x, N, c, k, print_info) 
            this.x = x;
            this.N = N;
            this.c = c;
            this.k = k;
            this.print_info = print_info;
        end
        function plot(this, X, graph_title)
            subplot(2, 2, 1);
            imagesc(reshape(X(:, end),this.N,this.N)), colormap gray, axis image off;
            caxis(this.c);
            title(graph_title);
            [relative_error,sparsity,sparsity_acc] = evaluate(this.x, X);
%             fprintf(1,'Relative error = %2.3f %%\n', relative_error);
%             fprintf(1,'sparsity = %d\nsparsity_acc = %2.3f %%\n', sparsity,sparsity_acc);
            subplot(2, 2, 2);
            plot(this.k, relative_error)
            title('rel err')
            subplot(2, 2, 3);
            plot(this.k, sparsity)
            title('sparsity')
            subplot(2, 2, 4);
            plot(this.k, sparsity_acc)
            title('sparsity acc')
        end
    end
end