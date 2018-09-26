function y = evalCheb(T,x)
  n = max(size(T));
  yp = repmat(x,n,1);
  yp(1,:) = ones(size(x));
  yp = cumprod(yp);
  y = T * yp;
end