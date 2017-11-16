function ret = compute_power(s, N)
    ret = 0;

    for i=1:N
        ret = ret + s(i) * s(i);
    end

    ret = ret / N;
end
