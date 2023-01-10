function show_image(signal)
    signal          = 128 * signal + 128;           % convert from [-1:1] to [0:256]
    reshaped_signal = reshape(signal, 256, 256);    % reshape to 256x256
    imshow(uint8(reshaped_signal));                 % show
end