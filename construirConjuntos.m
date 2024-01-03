function conjuntos = construirConjuntos(X)
    numericalToCategoricalAtributesMap = containers.Map({'largo_sep', 'ancho_sep', 'largo_pet', 'ancho_pet'}, {1, 2, 3, 4});
    construirReferencial = @(atributo) min(atributo):0.1:max(atributo);
    RA =  construirReferencial(X(:, numericalToCategoricalAtributesMap('largo_sep')));
    RB= construirReferencial(X(:, numericalToCategoricalAtributesMap('ancho_sep')));
    RC = construirReferencial(X(:, numericalToCategoricalAtributesMap('largo_pet')));
    RD = construirReferencial(X(:, numericalToCategoricalAtributesMap('ancho_pet')));
    A = construirSubconjuntos(RA, 'trimf');
    B = construirSubconjuntos(RB, 'trimf');
    C = construirSubconjuntos(RC, 'trimf');
    D = construirSubconjuntos(RD, 'trimf');
    conjuntos = struct('RA', RA, 'RB', RB, 'RC', RC, 'RD', RD, 'A', A, 'B', B, 'C', C, 'D', D);
end
