function frases = generarFrasesReglas(reglas)
    etiquetas = {'BAJO', 'MEDIO', 'ALTO'};
    numReglas = size(reglas, 1);
    frases = cell(numReglas, 1);
    for i = 1:numReglas
        etiqueta_LargoSepalo = etiquetas{reglas(i, 1)};
        etiqueta_AnchoSepalo = etiquetas{reglas(i, 2)};
        etiqueta_LargoPetalo = etiquetas{reglas(i, 3)};
        etiqueta_AnchoPetalo = etiquetas{reglas(i, 4)};
        clase = reglas(i, end);
        certeza = reglas(i, end - 1);
        frases{i} = sprintf('R%d: IF Largo Sepalo IS %s AND Ancho Sepalo IS %s AND Largo Petalo IS %s AND Ancho Petalo IS %s THEN Clase %d con Certeza = %.2f', ...
            i, etiqueta_LargoSepalo, etiqueta_AnchoSepalo, etiqueta_LargoPetalo, etiqueta_AnchoPetalo, clase, certeza);
    end
end
