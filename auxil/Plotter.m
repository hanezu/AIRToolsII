classdef Plotter
    properties
       x
       N
       c
       print_info
    end
    methods 
        function this = Plotter(x, N, c, print_info) 
            this.x = x;
            this.N = N;
            this.c = c;
            this.print_info = print_info;
        end
        function plot(this, X, graph_title)
            subplot();
            imagesc(reshape(X,this.N,this.N)), colormap gray, axis image off;
            caxis(this.c);
            title(graph_title);
            [relative_error,sparsity,sparsity_acc] = evaluate(this.x, X);
            fprintf(1,'Relative error = %2.3f %%\n', relative_error);
            fprintf(1,'sparsity = %d\nsparsity_acc = %2.3f %%\n', sparsity,sparsity_acc);
        end
    end
end