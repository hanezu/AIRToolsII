classdef Plotter
    properties
       N
       c
       print_info
    end
    methods 
        function this = Plotter(N, c, print_info) 
            this.N = N;
            this.c = c;
            this.print_info = print_info;
        end
        function plot(this, X, graph_title)
            subplot()
            imagesc(reshape(X,this.N,this.N)), colormap gray, axis image off
            caxis(this.c)
            title(graph_title)
            info
        end
    end
end