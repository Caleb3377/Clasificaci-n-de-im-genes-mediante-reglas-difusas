function compatibilidad = calcularCompatibilidad(ejemplo, reglas)
    numReglas = size(reglas, 1);
    compatibilidad = zeros(1, numReglas);

    for k = 1:numReglas
        % Obtén las etiquetas lingüísticas de la regla k
        Ak = reglas(k, 1);
        Bk = reglas(k, 2);
        Ck = reglas(k, 3);
        Dk = reglas(k, 4);

        % Calcula el grado de compatibilidad para la regla k
        compatibilidad(k) = Ak(ejemplo(1)) * Bk(ejemplo(2)) * Ck(ejemplo(3)) * Dk(ejemplo(4));
    end
end