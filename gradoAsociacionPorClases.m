function asocClase = gradoAsociacionPorClases(grados_asociacion, reglas, numClases)
    if nargin < 3
        numClases = 3;
    end
    asocClase = zeros(1, numClases);
    for i = 1:numClases
        asocClase(i) = mean(grados_asociacion(find(reglas(:, 6) == i)));
    end
end
