% Define the filter coefficients
h = [1, 2, 3, 4, 5]; % 4 coefficients for a moving average filter

% Input signal
x = [1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6]; % Sample input signal

% Initialize output signal
y = zeros(1, length(x));

% Apply FIR filter
for n = 1:length(x)
    % Apply filter at each sample point
    if n >= length(h)
        y(n) = sum(h .* x(n:-1:n-length(h)+1));
    else
        % For the first few samples, we don't have enough past values to
        % compute the filter output. We can either pad with zeros or wait
        % until we have enough samples.
        y(n) = sum(h(1:n) .* x(n:-1:1));
    end
end

% Display input and output signals
disp('Input signal:');
disp(x);
disp('Output signal:');
disp(y);
