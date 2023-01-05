function ser1 = ser(symbols, new_symbols)
    idx = find(symbols ~= new_symbols);
    ser1 = length(idx) / length(symbols);
end