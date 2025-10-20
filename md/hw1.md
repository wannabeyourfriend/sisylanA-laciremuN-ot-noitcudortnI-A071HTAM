**UC San Diego, Fall 2025**

---

**Name:** Zixuan Wang

**PID:** A19247820

---

### Problem 1

**a.** 

```matlab
A = rand(9);
x = rand(9, 1);
[m, n] = size(A);
if length(x) ~= n
    error('The dimensions of A and x are not compatible for multiplication.');
end
Ax = zeros(m, 1);
for i = 1:m
    for j = 1:n
        Ax(i) = Ax(i) + A(i, j) * x(j);
    end
end
disp('Result of Ax using nested loops:');
disp(Ax);
disp('Result of A * x using MATLAB built-in:');
disp(A * x);
```

![截屏2025-10-07 15.12.57.png](attachment:339d172c-ca22-4c43-9db3-0bf469f66ce5:截屏2025-10-07_15.12.57.png)

**b.**

For an `m × n` matrix `A` and a `n × 1` vector `x`:

- Each element of `y(i)` requires n multiplications and n-1 additions.
- Total multiplications: `m * n`
- Total additions: `m * (n - 1)`
- So

$$
\text{FLOPs} = m \cdot (2n - 1)
$$

---

### Problem 2

**a.**

```matlab
function C = myMatrixMultiply(A, B)
    [m, n] = size(A);
    [n2, p] = size(B);
    
    if n ~= n2
        error('Number of columns of A must equal number of rows of B.');
    end
   
    C = zeros(m, p);
    for i = 1:m
        for j = 1:p
            for k = 1:n
                C(i, j) = C(i, j) + A(i, k) * B(k, j);
            end
        end
    end
end

```

![截屏2025-10-07 15.19.56.png](attachment:272435c7-d242-4b3d-b2c1-7d5a51074897:截屏2025-10-07_15.19.56.png)

**b.**

For matrix multiplication using three loops:

- For each element `C(i,j)`:
    - There are `n` multiplications `A(i,k)*B(k,j)`
    - There are `n-1` additions to sum them up
- Total elements in `C` is `m*p`

So

$$
\text{FLOPs} = m \cdot p \cdot (2n - 1)
$$

---