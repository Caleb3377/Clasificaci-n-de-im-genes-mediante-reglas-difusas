function asociacion = gradoAsociacion(reglas, compatibilidad)
    asociacion = compatibilidad .* reglas(:, 5);
end