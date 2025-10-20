**UC San Diego, Fall 2025**

---

**Name:** Zixuan Wang

**PID:** A19247820

---

### Problem 1

Given
$$
L_1=\begin{pmatrix}1&0&0\\ l_{21}&1&0\\0&0&1\end{pmatrix},\quad
L_2=\begin{pmatrix}1&0&0\\0&1&0\\ l_{31}&0&1\end{pmatrix},\quad
L_3=\begin{pmatrix}1&0&0\\0&1&0\\0&l_{32}&1\end{pmatrix}.
$$

Compute $L_2L_3$ first. Multiply rows/columns:

$$L_2L_3=
\begin{pmatrix}
1&0&0\\
0&1&0\\
l_{31}&0&1
\end{pmatrix}
\begin{pmatrix}
1&0&0\\
0&1&0\\
0&l_{32}&1
\end{pmatrix}
=
\begin{pmatrix}
1&0&0\\
0&1&0\\
l_{31}&l_{32}&1
\end{pmatrix}.$$

Now multiply $L_1$ on the left:

$$L_1(L_2L_3)=
\begin{pmatrix}1&0&0\\ l_{21}&1&0\\0&0&1\end{pmatrix}
\begin{pmatrix}1&0&0\\0&1&0\\l_{31}&l_{32}&1\end{pmatrix}
=
\begin{pmatrix}
1&0&0\\
l_{21}&1&0\\
l_{31}&l_{32}&1
\end{pmatrix}.$$

So indeed $L_1L_2L_3=L$ with
$$L=\begin{pmatrix}1&0&0\\ l_{21}&1&0\\ l_{31}&l_{32}&1\end{pmatrix}.$$

---

### Problem 2

Upper-triangular $R$ with positive diagonal entries such that $M = R^T R$.

Write $$R=\begin{pmatrix}r_{11}&r_{12}&r_{13}\\0&r_{22}&r_{23}\\0&0&r_{33}\end{pmatrix}.$$

(a) Matrix $A$

$$A=\begin{pmatrix}1&-2&0\\-2&13&6\\0&6&5\end{pmatrix}.$$

Matching $A=R^T R$ gives equations:

* $A_{11}=r_{11}^2=1$ ⇒ $r_{11}=1$ (positive).
* $A_{12}=r_{11}r_{12}=-2$ ⇒ $r_{12}=-2$.
* $A_{13}=r_{11}r_{13}=0$ ⇒ $r_{13}=0$.
* $A_{22}=r_{12}^2+r_{22}^2=4+r_{22}^2=13$ ⇒ $r_{22}^2=9$ ⇒ $r_{22}=3$ (positive).
* $A_{23}=r_{12}r_{13}+r_{22}r_{23}=0+3r_{23}=6$ ⇒ $r_{23}=2$.
* $A_{33}=r_{13}^2+r_{23}^2+r_{33}^2=0+4+r_{33}^2=5$ ⇒ $r_{33}^2=1$ ⇒ $r_{33}=1$ (positive).

Thus the Cholesky factor (upper triangular) is
$$\boxed{R=\begin{pmatrix}1&-2&0\\0&3&2\\0&0&1\end{pmatrix},\quad A=R^TR}$$

(b) Matrix $B$

$$B=\begin{pmatrix}4&-4&0\\-4&4&0\\0&0&5\end{pmatrix}.$$


The leading $2\times2$ principal minor of $B$ is $$\det\begin{pmatrix}4&-4\\-4&4\end{pmatrix}=0$$, so $B$ is not positive definite (it is positive semi-definite for the first $2\times2$ block). Therefore $B$ does not have a Cholesky factorization (as a positive-definite Cholesky) with strictly positive diagonal entries.


---

### Problem 3

Let $A$ be symmetric positive definite $A=A^T$, and $z^T A z>0$ for all nonzero $z$. Let $X$ be invertible and define $B = X^T A X$.

**Symmetry:**
$$B^T = (X^T A X)^T = X^T A^T X = X^T A X = B$$
since $A^T=A$. So $B$ is symmetric.

**Positive definiteness:**
Take any nonzero vector $y$. Consider $y^T B y = y^T X^T A X y = (Xy)^T A (Xy)$. Because $X$ is invertible, $Xy\neq 0$ when $y\neq0$. Since $A$ is positive definite, $(Xy)^T A (Xy)>0$. Hence $y^T B y>0$ for all nonzero $y$, so $B$ is positive definite.

Therefore $B$ is symmetric positive definite.

---

### Problem 4

First, we define the permutation matrix $P$ as follows (this is a common definition that matches the problem description):
$$P_{ij}=\begin{cases}1,& i=p(j),\\0,&\text{otherwise.}\end{cases}$$
That is, the $j$-th column has a 1 in the $p(j)$-th row, and 0 elsewhere. According to this definition, left multiplication by $P$ will send the original matrix's $j$-th row to the $p(j)$-th row (as we will see below).

(a)

Consider any element of matrix $AP^{T}$, the element in the $k$-th row and $i$-th column is
$$(AP^{T})_{ki}=\sum_{j=1}^{n} A_{kj} P^{T}_{ji}.$$
Since $P^{T}_{ji}=P_{ij}$, and by definition $P_{ij}=1$ if and only if $i=p(j)$, in the sum only when $j=p^{-1}(i)$ is the term non-zero. Therefore
$$(AP^{T})_{ki}=A_{k,p^{-1}(i)}.$$
This shows that: the $i$-th column of $AP^{T}$ equals the $p^{-1}(i)$-th column of $A$. Equivalently, the original $j$-th column of $A$ is moved to the $p(j)$-th column of $AP^{T}$. So $AP^{T}$ permutes the columns of $A$ according to permutation $p$.

(b)

Directly compute the components of the matrix product: the element in the $i$-th row and $k$-th column is
$$(PP^{T})_{ik}=\sum_{j=1}^{n} P_{ij} P^{T}_{jk}=\sum_{j=1}^{n} P_{ij} P_{kj}.$$
For fixed $j$, $P_{ij}P_{kj}=1$ if and only if both $i=p(j)$ and $k=p(j)$, i.e., if and only if $i=k$ and $j=p^{-1}(i)$. Therefore the sum has exactly one term equal to 1 when $i=k$, and 0 otherwise; if $i\neq k$, there is no $j$ that can make both factors equal to 1, so the sum is 0. Thus
$$(PP^{T})_{ik}=\begin{cases}1,& i=k,\\0,& i\neq k,\end{cases}$$
i.e., $PP^{T}=I_{n}$. This also shows that $P^{-1}=P^{T}$, and permutation matrices are orthogonal (consisting of only 0s and 1s with exactly one 1 per row and column).

---

### Problem 5

```matlab
function x = ge_solve_pp(A,b)
    % ge_solve_pp  Solve Ax=b by Gaussian elimination with partial pivoting.
    %   x = ge_solve_pp(A,b)
    %   A: n-by-n matrix
    %   b: n-by-1 vector
    %   Returns x solving Ax=b. Uses row swaps (partial pivoting).

    [n,m] = size(A);
    if n~=m
        error('A must be square');
    end
    if size(b,1)~=n || size(b,2)~=1
        error('b must be n-by-1');
    end

    for k = 1:n-1
        [~, pivot_rel] = max(abs(A(k:n,k)));
        pivot = pivot_rel + k - 1;
        if A(pivot,k) == 0
            error('Matrix is singular (zero pivot).');
        end
        if pivot ~= k
            A([k pivot], :) = A([pivot k], :);
            b([k pivot])    = b([pivot k]);
        end

        for i = k+1:n
            m_ik = A(i,k) / A(k,k);
            A(i,k:n) = A(i,k:n) - m_ik * A(k,k:n);
            b(i)     = b(i) - m_ik * b(k);
        end
    end

    if A(n,n) == 0
        error('Matrix is singular (zero pivot at last step).');
    end

    x = zeros(n,1);
    for i = n:-1:1
        x(i) = (b(i) - A(i,i+1:n)*x(i+1:n)) / A(i,i);
    end
end
```