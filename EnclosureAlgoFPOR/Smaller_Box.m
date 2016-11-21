function answer = Smaller_Box( y_old , z_old , y_new , z_new , k )

    answer = any( z_new + k * y_old < y_new + k * z_old ) ;
    
end