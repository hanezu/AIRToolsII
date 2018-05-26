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
        function plot(this, X, graph_title)
            subplot(2, 2, 1);
            imagesc(reshape(X(:, end),this.N,this.N)), colormap gray, axis image off;
            caxis(this.c);
            title(graph_title);
            [relative_error,sparsity,sparsity_acc] = evaluate(this.x, X);
%             fprintf(1,'Relative error = %2.3f %%\n', relative_error);
%             fprintf(1,'sparsity = %d\nsparsity_acc = %2.3f %%\n', sparsity,sparsity_acc);
            subplot(2, 2, 2);
            t = this.k * size(this.A,1);
            semilogx(t, relative_error)
            title('relative error')
            subplot(2, 2, 3);
            semilogx(t, sparsity)
            title('sparsity')
            subplot(2, 2, 4);
            semilogx(t, sparsity_acc)
            title('sparsity accuracy')
        end
    end
end