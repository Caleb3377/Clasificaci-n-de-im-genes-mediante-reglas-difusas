function grados = calcularGradosPertenencia(valor, referencial, conjuntos)
    % Calcula los grados de pertenencia asociados a las etiquetas
    grados = conjuntos(:, find(round(referencial, 1) == round(valor, 1)));
end