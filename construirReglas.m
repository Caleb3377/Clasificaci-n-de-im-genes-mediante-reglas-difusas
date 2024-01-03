function [reglas, valoresR] = construirReglas(X_train, Y_train, conjuntos)
    num_ejemplos = size(X_train, 1);
    reglas = [];
    valoresR = [];
    for i = 1:num_ejemplos
        % Paso 1: Calcula los grados de pertenencia para cada variable
        grados_A = calcularGradosPertenencia(X_train(i, 1), conjuntos.RA, conjuntos.A);
        grados_B = calcularGradosPertenencia(X_train(i, 2), conjuntos.RB, conjuntos.B);
        grados_C = calcularGradosPertenencia(X_train(i, 3), conjuntos.RC, conjuntos.C);
        grados_D = calcularGradosPertenencia(X_train(i, 4), conjuntos.RD, conjuntos.D);
        % Paso 2: Asigna el ejemplo a la etiqueta con mayor grado para cada variable
        etiqueta_A = encontrarEtiqueta(grados_A);
        etiqueta_B = encontrarEtiqueta(grados_B);
        etiqueta_C = encontrarEtiqueta(grados_C);
        etiqueta_D = encontrarEtiqueta(grados_D);
        % Paso 3: Estudia el grado de certeza de cada regla
        grado_certeza = T([max(grados_A) max(grados_B) max(grados_C) max(grados_D)], 'prod');
        % Almacena la regla en la matriz de reglas
        if i == 1
            reglas = [etiqueta_A etiqueta_B etiqueta_C etiqueta_D grado_certeza Y_train(i)];
            valoresR = [max(grados_A) max(grados_B) max(grados_C) max(grados_D)];
        else
            h = ismember(reglas(:, 1:4), [etiqueta_A etiqueta_B etiqueta_C etiqueta_D], 'rows');
            if sum(h)==0
                reglas = cat(1, reglas, [etiqueta_A etiqueta_B etiqueta_C etiqueta_D grado_certeza Y_train(i)]);
                valoresR = cat(1, valoresR, [max(grados_A) max(grados_B) max(grados_C) max(grados_D)]);
            elseif sum(h)>0 && reglas(h,5) < grado_certeza
                reglas(h, :) = [etiqueta_A etiqueta_B etiqueta_C etiqueta_D grado_certeza Y_train(i)];
                valoresR(h, :) = [max(grados_A) max(grados_B) max(grados_C) max(grados_D)];
            end
        end
    end
end