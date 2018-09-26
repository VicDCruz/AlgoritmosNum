function yLag = interpLagrange(xi, yi, xVal)

    n= length(xi);
    if length(yi) ~=n
        error('Los vectores X y Y, no tienen la misma longitud');
    end
    suma = 0;
    for i = 1:n
        producto = yi(i);
        for j = 1:n
            if j ~= i
                producto = producto .* (xVal - xi(j))./(xi(i) - xi(j));
            end            
        end
        suma = suma + producto;
    end
    yLag = suma;
end