function compatibilidad = gradoCompatibilidad(ejemplo, reglas, conjuntos)
    grados_A = calcularGradosPertenencia(ejemplo(1), conjuntos.RA, conjuntos.A);
    grados_B = calcularGradosPertenencia(ejemplo(2), conjuntos.RB, conjuntos.B);
    grados_C = calcularGradosPertenencia(ejemplo(3), conjuntos.RC, conjuntos.C);
    grados_D = calcularGradosPertenencia(ejemplo(4), conjuntos.RD, conjuntos.D);
    Ak = grados_A(reglas(:, 1));
    Bk = grados_B(reglas(:, 2));
    Ck = grados_C(reglas(:, 3));
    Dk = grados_D(reglas(:, 4));
    compatibilidad = T([Ak Bk Ck Dk], 'prod');
end