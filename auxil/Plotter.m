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
            info;
            relative_error = safe_relative_error(this.x, X);
            fprintf(1,'Relative error = %2.3f %%\n', relative_error);
        end
    end
end